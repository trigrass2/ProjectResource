
/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

package org.tspm;

import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.6
 * 2016-11-24T19:29:42.276+08:00
 * Generated source version: 3.1.6
 * 
 */

@javax.jws.WebService(
                      serviceName = "REC_DAS_Service",
                      portName = "REC_DAS_ServiceSoap12",
                      targetNamespace = "http://tempuri.org/",
                      wsdlLocation = "file:/F:/REC_DAS-Service.wsdl",
                      endpointInterface = "org.tspm.RECDASServiceSoap")
                      
public class REC_DAS_ServiceSoap12Impl implements RECDASServiceSoap {

    private static final Logger LOG = Logger.getLogger(REC_DAS_ServiceSoap12Impl.class.getName());

    /* (non-Javadoc)
     * @see org.tspm.RECDASServiceSoap#executeXMLDAS(java.lang.String  strXML )*
     */
    public org.tspm.ArrayOfString executeXMLDAS(java.lang.String strXML) { 
        LOG.info("Executing operation executeXMLDAS");
        System.out.println(strXML);
        try {
            org.tspm.ArrayOfString _return = null;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}
