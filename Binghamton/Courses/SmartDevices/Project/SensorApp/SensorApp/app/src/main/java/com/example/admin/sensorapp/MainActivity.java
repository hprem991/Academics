package com.example.admin.sensorapp;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements SensorEventListener {

    Sensor acclerometer  ;
    SensorManager manager;
    TextView textView;
    FileProcessor fileProcessor;

    public MainActivity(){
        fileProcessor = new FileProcessor("Data.txt");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        manager =  (SensorManager)getSystemService(SENSOR_SERVICE);
        acclerometer = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        manager.registerListener(this,acclerometer,SensorManager.SENSOR_DELAY_NORMAL);
        textView = (TextView)findViewById(R.id.ACCL);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        try {
            /* 
            if(threshold(event.values[0]) || threshold(event.values[1]) || threshold(event.values[2])){
            String line = event.values[0] + " " + event.values[1] + " " + event.values[2];
            String output = fileProcessor.writeLineToFile(line);
            if (output.equals("No Issues")) {
                textView.setText(" X: " + event.values[0] +
                        "\n Y: " + event.values[1] +
                        "\n Z: " + event.values[2] +
                        "\n File Path" + this.getFilesDir().getAbsolutePath());
            } else {
                // }
                textView.setText(" X: " + event.values[0] +
                        "\n Y: " + event.values[1] +
                        "\n Z: " + event.values[2] +
                        "\n Error Message " + output);
            } 
             */
            textView.setText(" X: " + event.values[0] +
                             "\n Y: " + event.values[1] +
                             "\n Z: " + event.values[2] +
                             "\n Error Message " + output);
	
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
