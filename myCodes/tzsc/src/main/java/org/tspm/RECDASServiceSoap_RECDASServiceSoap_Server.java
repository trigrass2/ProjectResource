
package org.tspm;

import javax.xml.ws.Endpoint;

/**
 * This class was generated by Apache CXF 3.1.6
 * 2016-11-24T19:29:42.327+08:00
 * Generated source version: 3.1.6
 * 
 */
 
public class RECDASServiceSoap_RECDASServiceSoap_Server{

    protected RECDASServiceSoap_RECDASServiceSoap_Server() throws java.lang.Exception {
        System.out.println("Starting Server");
        Object implementor = new REC_DAS_ServiceSoapImpl();
        String address = "http://10.114.81.244:6666/DAS/DAS_REC/REC_DAS_Service.asmx";
        Endpoint.publish(address, implementor);
    }
    
    public static void main(String args[]) throws java.lang.Exception { 
        new RECDASServiceSoap_RECDASServiceSoap_Server();
        System.out.println("Server ready..."); 
        
        Thread.sleep(5 * 60 * 1000); 
        System.out.println("Server exiting");
        System.exit(0);
    }
}
