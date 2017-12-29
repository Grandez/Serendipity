066200 PROCEDURE DIVISION.                                              
066300                       
202200     IF  CONTINUO AND                                             
202300         (WS-TIPO (1:1) = WSC-A OR WS-TIPO (1:1) = WSC-B)         

           IF then A > B .
           IF (a > B) AND (B > A) .                                            
066400     MOVE A TO B.
           MOVE A(3:5) TO B.
           MOVE A((B + 2) , 3)(3:5) TO B.
