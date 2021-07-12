package com.hoho.android.usbserial.examples;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbManager;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.ListFragment;

import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.github.mikephil.charting.components.Description;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.listener.ChartTouchListener;
import com.github.mikephil.charting.listener.OnChartGestureListener;
import com.github.mikephil.charting.listener.OnChartValueSelectedListener;
import com.hoho.android.usbserial.driver.UsbSerialDriver;
import com.hoho.android.usbserial.driver.UsbSerialProber;

import com.hoho.android.usbserial.driver.UsbSerialDriver;
import com.hoho.android.usbserial.driver.UsbSerialPort;
import com.hoho.android.usbserial.driver.UsbSerialProber;
import com.hoho.android.usbserial.util.HexDump;
import com.hoho.android.usbserial.util.SerialInputOutputManager;

import com.github.mikephil.charting.animation.Easing;
import com.github.mikephil.charting.charts.LineChart;

import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.Legend.LegendForm;
import com.github.mikephil.charting.components.LimitLine;
import com.github.mikephil.charting.components.LimitLine.LimitLabelPosition;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.listener.ChartTouchListener;
import com.github.mikephil.charting.listener.OnChartGestureListener;
import com.github.mikephil.charting.listener.OnChartValueSelectedListener;
import com.github.mikephil.charting.utils.Utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.EnumSet;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class DevicesFragment extends ListFragment implements OnChartGestureListener, OnChartValueSelectedListener{

    @Override
    public void onChartGestureStart(MotionEvent me, ChartTouchListener.ChartGesture lastPerformedGesture) {
        Log.i("Gesture", "START, x: " + me.getX() + ", y: " + me.getY());
    }

    @Override
    public void onChartGestureEnd(MotionEvent me, ChartTouchListener.ChartGesture lastPerformedGesture) {
        Log.i("Gesture", "END, lastGesture: " + lastPerformedGesture);

        // un-highlight values after the gesture is finished and no single-tap
        if(lastPerformedGesture != ChartTouchListener.ChartGesture.SINGLE_TAP)
            mChart.highlightValues(null); // or highlightTouch(null) for callback to onNothingSelected(...)
    }

    @Override
    public void onChartLongPressed(MotionEvent me) {
        Log.i("LongPress", "Chart longpressed.");
    }

    @Override
    public void onChartDoubleTapped(MotionEvent me) {
        Log.i("DoubleTap", "Chart double-tapped.");
    }

    @Override
    public void onChartSingleTapped(MotionEvent me) {
        Log.i("SingleTap", "Chart single-tapped.");
    }

    @Override
    public void onChartFling(MotionEvent me1, MotionEvent me2, float velocityX, float velocityY) {
        Log.i("Fling", "Chart flinged. VeloX: " + velocityX + ", VeloY: " + velocityY);
    }

    @Override
    public void onChartScale(MotionEvent me, float scaleX, float scaleY) {
        Log.i("Scale / Zoom", "ScaleX: " + scaleX + ", ScaleY: " + scaleY);
    }

    @Override
    public void onChartTranslate(MotionEvent me, float dX, float dY) {
        Log.i("Translate / Move", "dX: " + dX + ", dY: " + dY);
    }

    @Override
    public void onValueSelected(Entry e, Highlight h) {
        Log.i("Entry selected", e.toString());
        Log.i("LOWHIGH", "low: " + mChart.getLowestVisibleX() + ", high: " + mChart.getHighestVisibleX());
        Log.i("MIN MAX", "xmin: " + mChart.getXChartMin() + ", xmax: " + mChart.getXChartMax() + ", ymin: " + mChart.getYChartMin() + ", ymax: " + mChart.getYChartMax());
    }

    @Override
    public void onNothingSelected() {
        Log.i("Nothing selected", "Nothing selected.");
    }

    static class ListItem {
        UsbDevice device;
        int port;
        UsbSerialDriver driver;

        ListItem(UsbDevice device, int port, UsbSerialDriver driver) {
            this.device = device;
            this.port = port;
            this.driver = driver;
        }
    }

    private final ArrayList<ListItem> listItems = new ArrayList<>();
    private ArrayAdapter<ListItem> listAdapter;
    private int baudRate = 19200;
    private boolean withIoManager = true;
    private LineChart mChart;
    private TextView tvX, tvY;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        listAdapter = new ArrayAdapter<ListItem>(getActivity(), 0, listItems) {
            @NonNull
            @Override
            public View getView(int position, View view, @NonNull ViewGroup parent) {
                ListItem item = listItems.get(position);
                if (view == null)
                    view = getActivity().getLayoutInflater().inflate(R.layout.device_list_item, parent, false);
                //mChart = (LineChart) view.findViewById(R.id.lineChart2);
                TextView text1 = view.findViewById(R.id.text1);
                TextView text2 = view.findViewById(R.id.text2);
//                Button displayBtn = (Button) findViewById(R.id.display);
//                displayBtn.setOnClickListener(v -> displayChart());
                if(item.driver == null)
                    text1.setText("<no driver>");
                else if(item.driver.getPorts().size() == 1)
                    text1.setText(item.driver.getClass().getSimpleName().replace("SerialDriver",""));
                else
                    text1.setText(item.driver.getClass().getSimpleName().replace("SerialDriver","")+", Port "+item.port);
                text2.setText(String.format(Locale.US, "Vendor %04X, Product %04X", item.device.getVendorId(), item.device.getProductId()));
                return view;
            }
        };
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setListAdapter(null);
        View header = getActivity().getLayoutInflater().inflate(R.layout.device_list_header, null, false);
        getListView().addHeaderView(header, null, false);
        //setEmptyText("<no USB devices found>");
        //((TextView) getListView().getEmptyView()).setTextSize(18);
        mChart = (LineChart) header.findViewById(R.id.lineChart2);
        initLineChart();
        setListAdapter(listAdapter);
    }

    @Override
    public void onCreateOptionsMenu(@NonNull Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.menu_devices, menu);
    }

    @Override
    public void onResume() {
        super.onResume();
        refresh();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if(id == R.id.refresh) {
            refresh();
            return true;
        } else if (id ==R.id.baud_rate) {
            final String[] values = getResources().getStringArray(R.array.baud_rates);
            int pos = java.util.Arrays.asList(values).indexOf(String.valueOf(baudRate));
            AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
            builder.setTitle("Baud rate");
            builder.setSingleChoiceItems(values, pos, (dialog, which) -> {
                baudRate = Integer.parseInt(values[which]);
                dialog.dismiss();
            });
            builder.create().show();
            return true;
        } else if (id ==R.id.read_mode) {
            final String[] values = getResources().getStringArray(R.array.read_modes);
            int pos = withIoManager ? 0 : 1; // read_modes[0]=event/io-manager, read_modes[1]=direct
            AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
            builder.setTitle("Read mode");
            builder.setSingleChoiceItems(values, pos, (dialog, which) -> {
                withIoManager = (which == 0);
                dialog.dismiss();
            });
            builder.create().show();
            return true;
        } else {
            return super.onOptionsItemSelected(item);
        }
    }

    void refresh() {
        UsbManager usbManager = (UsbManager) getActivity().getSystemService(Context.USB_SERVICE);
        UsbSerialProber usbDefaultProber = UsbSerialProber.getDefaultProber();
        UsbSerialProber usbCustomProber = CustomProber.getCustomProber();
        listItems.clear();
        for(UsbDevice device : usbManager.getDeviceList().values()) {
            UsbSerialDriver driver = usbDefaultProber.probeDevice(device);
            if(driver == null) {
                driver = usbCustomProber.probeDevice(device);
            }
            if(driver != null) {
                for(int port = 0; port < driver.getPorts().size(); port++)
                    listItems.add(new ListItem(device, port, driver));
            } else {
                listItems.add(new ListItem(device, 0, null));
            }
        }
        displayChart();
        listAdapter.notifyDataSetChanged();
    }

    private void displayChart(){
        // add data
        // 这是自己设定的添加数据的方法，count设置了数据的个数，range设置了波动范围
//        setData(20,100);

        InputStream inputStream = getResources().openRawResource(R.raw.f);
        String txt = getString(inputStream);

        String[] txtArray = new String[450];
        txtArray = txt.split("\n");
        setData(txtArray);

        // 返回图表的图例对象。这个方法可以用来获得图例的实例，以便定制自动生成的图例。
        Legend l = mChart.getLegend();
        l.setForm(LegendForm.LINE);
    }

    public static String getString(InputStream inputStream) {
        InputStreamReader inputStreamReader = null;
        try {
            inputStreamReader = new InputStreamReader(inputStream, "gbk");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        BufferedReader reader = new BufferedReader(inputStreamReader);
        StringBuffer sb = new StringBuffer("");
        String line;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
                sb.append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    /**
     * 初始化折线图控件属性
     */
    private void initLineChart() {
        // 设置表格的一些属性
        // 在图表执行动作时，为定制回调设置一个动作监听器。
        mChart.setOnChartGestureListener(this);
        // 为图表设置一个既定的监听器
        mChart.setOnChartValueSelectedListener(this);
        // 把这个设为true来绘制网格背景，如果false则不绘制
        mChart.setDrawGridBackground(false);

        // 把这个设置为false，禁用所有手势和图表上的触摸，默认：true
        mChart.setTouchEnabled(false);

        // 设置图标拖动为允许
        mChart.setDragEnabled(true);
        // 设置图表缩放为允许
        mChart.setScaleEnabled(true);
        mChart.setScaleXEnabled(true);
        mChart.setScaleYEnabled(true);

        Description description = new Description();
        description.setText("title");
        description.setTextSize(16);
        mChart.setDescription(description);

        // 挤压缩放设置为允许，即X轴和Y轴会成比例缩放，如果设置为false，则变成单独缩放
        mChart.setPinchZoom(true);

        // 返回代表所有x标签的对象，这个方法可以用来获得XAxis对象并修改它（例如改变标签的位置、样式等）
        XAxis xAxis = mChart.getXAxis();
        // 返回左y轴对象。在水平的柱状图中，这是最上面的轴。
        YAxis leftAxis = mChart.getAxisLeft();
        leftAxis.removeAllLimitLines();

        // 使网格线在虚线模式下绘制，例如像这个“------”。只有在硬件加速被关闭的情况下才会起作用。记住，硬件加速会提高性能。
        leftAxis.enableGridDashedLine(10f, 10f, 0f);
        // 将其设置为true，无论是否启用其他网格线，都要画出零线。默认值:假
        leftAxis.setDrawZeroLine(true);

        // limit lines are drawn behind data (and not on top)
        // 如果这被设置为true，那么界限就会被绘制在实际的数据后面，否则就在上面。默认值:假
        leftAxis.setDrawLimitLinesBehindData(false);

        //是否显示网格线
        mChart.getAxisRight().setEnabled(false);
        mChart.getAxisLeft().setEnabled(false);
        mChart.getXAxis().setEnabled(false);

        // 调用动画对图表显示进行处理
        //mChart.animateX(2500, Easing.EaseInOutQuart);
        mChart.animateX(2500);
    }

    // 重写，传入从txt中读取的字符串
    private void setData(String[] dataString) {
        int count = dataString.length;
        // 这个应该就是x轴的数据了
        ArrayList<String> xVals = new ArrayList<String>();
        // 从 0 到 count设置x轴的数据
        for (int i = 0; i < count; i++) {
            xVals.add((i) + "");
        }

        ArrayList<Entry> yVals = new ArrayList<Entry>();
        // 设置y轴的数据，在这里，是用random函数来生成的
        for (int i = 0; i < count; i++) {
            float val = Float.parseFloat(dataString[i]);
            yVals.add(new Entry(i, val));
        }
        LineDataSet set1 = new LineDataSet(yVals, "BVP - WAVE");
        set1.enableDashedLine(10f, 0f, 0f);
        // 允许在虚线模式下画出高光线，例如，像这样“------”
        set1.enableDashedHighlightLine(10f, 0f, 0f);
        set1.setColor(Color.RED);
        set1.setCircleColor(Color.RED);
        set1.setLineWidth(3f);
        set1.setCircleRadius(1f);
        // 把这个设置为true，允许在每个数据圆上画一个洞。
        set1.setDrawCircleHole(false);
        set1.setValueTextSize(0f);

        set1.setDrawFilled(false);

        if(Utils.getSDKInt() >= 18) {
            // fill drawable only supported on api level 18 and above
            //Drawable drawable = ContextCompat.getDrawable(this, R.drawable.fade_red);
            //set1.setFillDrawable(drawable);
            set1.setFillColor(Color.BLUE);
        } else {
            set1.setFillColor(Color.BLACK);
        }

        ArrayList<ILineDataSet> dataSets = new ArrayList<ILineDataSet>();
        dataSets.add(set1); // add the datasets

        // create a data object with the datasets
        LineData data = new LineData(dataSets);

        // set data
        mChart.setData(data);
        mChart.notifyDataSetChanged(); // let the chart know it's data changed
        mChart.invalidate(); // refresh
    }

    // 设置数据的函数
    private void setData(int count, float range) {

        // 这个应该就是x轴的数据了
        ArrayList<String> xVals = new ArrayList<String>();
        // 从 0 到 count设置x轴的数据
        for (int i = 0; i < count; i++) {
            xVals.add((i) + "");
        }
        // 这个是y轴的数据
        ArrayList<Entry> yVals = new ArrayList<Entry>();
        // 设置y轴的数据，在这里，是用random函数来生成的
        for (int i = 0; i < count; i++) {

            float mult = (range + 1);
            float val = (float) (Math.random() * mult) + 3;// + (float)
            // ((mult *
            // 0.1) / 10);
            yVals.add(new Entry(i, val));
        }
        // MPAC自定义的一种类
        // create a dataset and give it a type
        LineDataSet set1 = new LineDataSet(yVals, "BVP - WAVE");
        // set1.setFillAlpha(110);
        // set1.setFillColor(Color.RED);

        // set the line to be drawn like this "- - - - - -"
        // 下面是设置线的各种属性
        // 允许在虚线模式下画出线，例如像这个“------”。只有在硬件加速被关闭的情况下才会起作用。记住，硬件加速会提高性能。
        set1.enableDashedLine(10f, 5f, 0f);
        // 允许在虚线模式下画出高光线，例如，像这样“------”
        set1.enableDashedHighlightLine(10f, 5f, 0f);
        set1.setColor(Color.RED);
        set1.setCircleColor(Color.RED);
        set1.setLineWidth(2f);
        set1.setCircleRadius(0f);
        // 把这个设置为true，允许在每个数据圆上画一个洞。
        set1.setDrawCircleHole(false);
        set1.setValueTextSize(0f);

        set1.setDrawFilled(false);
        byte data2[] = HexDump.hexStringToByteArray("a1");
        //byte data2[] = {(byte) 0xa1};
        System.out.println(data2);
        if(Utils.getSDKInt() >= 18) {
            // fill drawable only supported on api level 18 and above
            //Drawable drawable = ContextCompat.getDrawable(this, R.drawable.fade_red);
            //set1.setFillDrawable(drawable);
            set1.setFillColor(Color.BLUE);
        } else {
            set1.setFillColor(Color.BLACK);
        }

        ArrayList<ILineDataSet> dataSets = new ArrayList<ILineDataSet>();
        dataSets.add(set1); // add the datasets

        // create a data object with the datasets
        LineData data = new LineData(dataSets);

        // set data
        mChart.setData(data);
        mChart.notifyDataSetChanged(); // let the chart know it's data changed
        mChart.invalidate(); // refresh
        String sss = new String("1515");
        byte[] bytessss = new byte[2];
        bytessss = HexDump.hexStringToByteArray(sss);
//        bytessss = TerminalFragment.hexStrToBinaryStr(sss);
//
//        byte[] bytessss2 = new byte[]{(byte)0x95,(byte)0x95};
//        String sss2 = TerminalFragment.bytesToHexString(bytessss2);
    }


    @Override
    public void onListItemClick(@NonNull ListView l, @NonNull View v, int position, long id) {
        ListItem item = listItems.get(position-1);
        if(item.driver == null) {
            Toast.makeText(getActivity(), "no driver", Toast.LENGTH_SHORT).show();
        } else {
            Bundle args = new Bundle();
            args.putInt("device", item.device.getDeviceId());
            args.putInt("port", item.port);
            args.putInt("baud", baudRate);
            args.putBoolean("withIoManager", withIoManager);
            Fragment fragment = new TerminalFragment();
            fragment.setArguments(args);
            getFragmentManager().beginTransaction().replace(R.id.fragment, fragment, "terminal").addToBackStack(null).commit();
        }
    }

}
