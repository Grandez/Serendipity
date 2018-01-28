      *> SDP DESC CICS RESP                                                     
      *> SDP IVP 0 Issues.getCount = 1 - RESP ausente                       
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. AIVP60002                                                    
       AUTHOR.     USRIVP0 - SERENDIPITY                                     
       DATE-COMPILED. 01/01/2015.                                               
       
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
                                                                                
       01 W-FECHAS-TRABAJO.                                                     
          05 WKT-ABSTIME          PIC S9(15) COMP-3.                            
          05 WKT-AAAAMMDD-HOY.                                                  
            10 WKT-ANIO-HOY.                                                    
              15 WKT-SS-HOY      PIC 9(02) VALUE 20.                            
              15 WKT-AA-HOY      PIC 9(02).                                     
            10 WKT-AAAA-HOY     REDEFINES WKT-ANIO-HOY PIC 9(04).               
            10 WKT-MM-HOY       PIC 9(02).                                      
            10 WKT-DD-HOY       PIC 9(02).                                      
                                                                                
       PROCEDURE DIVISION.                                                      
       000000-CONTROL.                                                          
            EXEC CICS                                                           
                 ASKTIME                                                        
                 ABSTIME (WKT-ABSTIME)                                          
            END-EXEC                                                            
            EXEC CICS                                                           
                 RETURN                                                         
            END-EXEC.                                                           
