package com.example.admin.sensorapp;

/**
 * Created by admin on 4/21/16.
 */

import android.content.Context;
import android.os.Environment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;


public class FileProcessor {
    private BufferedReader br = null;
    private BufferedWriter bw = null;
    private FileOutputStream fileOutputStream = null;
    private FileInputStream fileInputStream = null;


    /********************************************************
     *
     * METHOD NAME : FileProcessor
     * INPUT           : String as a fileName
     * RETURNS         : FileProcessor object
     * PURPOSE     : Creation of FileProcessor object and
     *                           setting its member variables
     *
     ********************************************************/

    public FileProcessor(String fileName, Context context) {
        try {
           // File path = Environment.getExternalStoragePublicDirectory(
           //               Environment.DIRECTORY_DCIM);
           // File file = new File(path, "/" + fileName);
           // fileOutputStream  = new FileOutputStream(file);
            fileOutputStream  = context.openFileOutput(fileName, Context.MODE_PRIVATE);
           // fileInputStream = new FileInputStream(fileName);
            bw = new BufferedWriter(new OutputStreamWriter(fileOutputStream));
           // br = new BufferedReader(new InputStreamReader(fileInputStream));
        } catch (Exception e) {
            Logger.writeMessage("Processor Exception  " + e.getMessage(),
                                  Logger.DebugLevel.CONSTRUCTOR);
            e.printStackTrace();
        }
    }

    /********************************************************
     *
     * METHOD NAME : readLineFromFile
     * INPUT           : void
     * RETURNS         : String
     * PURPOSE     : one line of the file as a String at a time
     *
     ********************************************************/
    public String readLineFromFile() {
        String readline = null;
        try{
            readline = br.readLine();
        } catch (Exception e){
            Logger.writeMessage("Exception readLine  "+e.getMessage(),
                                  Logger.DebugLevel.NONE);
            e.printStackTrace();
        } finally {
            try {
                // br.close(); This is creating a socket close error
                //hence commented
            } catch(Exception e){
                //... This is ignored anyways
            }
        }
        return readline;
    }

    /********************************************************
     *
     * METHOD NAME : writeLineToFile
     * INPUT           : String
     * RETURNS         : void
     * PURPOSE     : writes one line to the file
     *
     ********************************************************/

    public boolean writeLineToFile(String line){
        try{
            System.out.println("Writing line " + line);
            fileOutputStream.write(line.getBytes());
            fileOutputStream.write("\n".getBytes());
           // bw.write(line);
            bw.newLine();
        } catch(Exception e){
            Logger.writeMessage("Exception writeLine  "+e.getMessage(),
                                 Logger.DebugLevel.NONE);
            e.printStackTrace();
            System.out.println("Exception Wring "+e.getMessage());
            return false;
        }
        return  true ;
    }

    /********************************************************
     *
     * METHOD NAME : close
     * INPUT           : void
     * RETURNS         : void
     * PURPOSE     : closes bufferedreader and bufferedwriter
     *
     ********************************************************/

    public void close(){
        try {
            br.close();
            bw.close();
        } catch (IOException e) {
            Logger.writeOutput("Could not close input/output stream " + e.getMessage());
        }
    }
 }
