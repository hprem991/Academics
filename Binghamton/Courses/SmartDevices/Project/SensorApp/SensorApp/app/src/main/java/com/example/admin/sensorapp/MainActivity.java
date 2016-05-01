package com.example.admin.sensorapp;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;

public class MainActivity extends AppCompatActivity implements SensorEventListener {

    Sensor acclerometer  ;
    SensorManager manager;
    TextView textView;
    FileProcessor fileProcessor;
    Button button;
    boolean record;

    public MainActivity(){
      //  fileProcessor = new FileProcessor("Data.txt");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        fileProcessor = new FileProcessor("Data.txt", getApplicationContext());
        manager =  (SensorManager)getSystemService(SENSOR_SERVICE);
        acclerometer = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        manager.registerListener(this,acclerometer,SensorManager.SENSOR_DELAY_NORMAL);
        textView = (TextView)findViewById(R.id.ACCL);
        button = (Button)findViewById(R.id.button);
        record = false;


        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(record){
                    record = false;
                } else {
                    record = true;
                }
            }
        });
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        try {

            if(threshold(event.values[0]) || threshold(event.values[1]) || threshold(event.values[2])) {
                String line = event.values[0] + " " + event.values[1] + " " + event.values[2] + " "+ System.currentTimeMillis();
                boolean output = false;
                if (record) {
                   output = fileProcessor.writeLineToFile(line);
                }

                if (output) {
                    textView.setText(" X: " + event.values[0] +
                            "\n Y: " + event.values[1] +
                            "\n Z: " + event.values[2] +
                            "\n Recording : ON " +
                            "\n File Path" + this.getFilesDir().getAbsolutePath());
                } else {
                    textView.setText(" X: " + event.values[0] +
                            "\n Y: " + event.values[1] +
                            "\n Z: " + event.values[2] +
                            "\n Recording : OFF " +
                            "\n Error: Failed to Log" );
                }
            }
        } catch (Exception e){
            textView.setText("Fucked up "+e.getMessage());
        }
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }

    boolean threshold(double value){
        double THRESHOLD = 1.0;
        return (value > THRESHOLD ? true: false);
    }
}
