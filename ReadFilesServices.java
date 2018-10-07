/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.services;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import sentiment.Analysis.PreProcessing;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ReadFilesServices {
    /*
    * Given the Full path ang get all data from file  After preprocessing in String form
    */
    public static String getDataFromFile(String f) {
        String retval = "";
        FileReader frd = null;
        BufferedReader br = null;
        try {
            frd = new FileReader(f);
            br = new BufferedReader(frd);
            String str;
            while ((str = br.readLine()) != null) {
                String str1[] = PreProcessing.allProcessing(str);
                for (String s : str1) {
                    retval += s + " ";
                }
            }
        } catch (Exception e) {
            System.out.println("CGet Data from File " + e);
        } finally {
            try {
                frd.close();
            } catch (Exception e) {
                System.out.println("Get Data from File finally " + e);
            }
        }
        return retval;
    }
    public static String[] getDataFromFileForPridiction(File f) {
        ArrayList<String> retval =new ArrayList<>();
        FileReader frd = null;
        BufferedReader br = null;
        try {
            frd = new FileReader(f);
            br = new BufferedReader(frd);
            String str;
            while ((str = br.readLine()) != null) {
                retval.add(str);
            }
        } catch (Exception e) {
            System.out.println("CGet Data from File " + e);
        } finally {
            try {
                frd.close();
            } catch (Exception e) {
                System.out.println("Get Data from File finally " + e);
            }
        }
        return retval.toArray(new String[retval.size()]);
    }
    
   
    /*
    *   Get All Files data from given File path in the form of String
    */
    public static ArrayList<String[]> getDataFromFile(final File f) 
    {
        ArrayList<String[]> all=new ArrayList<>();
        for (final File fileEntry : f.listFiles()) 
        {
            if (fileEntry.isDirectory()) 
            {
                getDataFromFile(fileEntry);
            } 
            else 
            {
                all.add(getDataFromFile(fileEntry.getAbsolutePath()).split(" "));
            }
        }
        return all;
    }
    
}
