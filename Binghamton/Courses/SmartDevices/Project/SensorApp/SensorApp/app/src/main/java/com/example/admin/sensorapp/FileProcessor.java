package com.example.admin.sensorapp;

/**
 * Created by admin on 4/21/16.
 */

import android.graphics.AvoidXfermode;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;


public class FileProcessor {
    private BufferedReader br = null;
    private BufferedWriter bw = null;
    private FileOutputStream fileOutputStream = null;


    /********************************************************
     *
     * METHOD NAME : FileProcessor
     * INPUT           : String as a fileName
     * RETURNS         : FileProcessor object
     * PURPOSE     : Creation of FileProcessor object and
     *                           setting its member variables
     *
     ********************************************************/

    public FileProcessor(String fileName) {
        try {
            br = new BufferedReader(new FileReader(fileName));
            fileOutputStream  = new FileOutputStream(fileName);
            bw = new BufferedWriter(new OutputStreamWriter(fileOutputStream));
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
    public String readLineFromFile(){
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

    public String writeLineToFile(String line){
        try{
            bw.write(line);
            bw.newLine();
        } catch(Exception e){
            Logger.writeMessage("Exception writeLine  "+e.getMessage(),
                                 Logger.DebugLevel.NONE);
            e.printStackTrace();
            return e.getMessage();
        }
        return  "No Issues";
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
