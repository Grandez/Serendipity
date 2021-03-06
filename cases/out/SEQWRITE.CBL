       IDENTIFICATION DIVISION.
       PROGRAM-ID.  SeqWrite.
       AUTHOR.  Michael Coughlan.
      * Example program showing how to create a sequential file
      * using the ACCEPT and the WRITE verbs.
      * Note: In this version of COBOL pressing the Carriage Return (CR)
      * without entering any data results in StudentDetails being filled
      * with spaces.
      *> SDP-DESC Esto es una descripcion
      *> SDP-DESC en dos lineas

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT StudentFile ASSIGN TO "STUDENTS.dat"
              ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01  StudentDetails.
           02  StudentId       PIC 9(7).
           02  StudentName.
               03 Surname      PIC X(8).
               03 Initials     PIC XX.
           02  DateOfBirth.
               03 YOBirth      PIC 9(4).
               03 MOBirth      PIC 9(2).
               03 DOBirth      PIC 9(2).
           02  CourseCode      PIC X(4).
           02  Gender          PIC X.

       WORKING-STORAGE SECTION.
       01  S14419952.
           03 TRAP    PIC X(08) VALUE 'SDPTRAPB'.
           03 NAME    PIC X(32) VALUE  'SeqWrite'.
           03 MD5ID.
              05 FILLER PIC X(16) VALUE 'CFC481E82EE63568'.
              05 FILLER PIC X(16) VALUE '6CD3C3170169E549'.
           03 SDPCNT.
              05 NBLK BINARY-LONG VALUE 4.
              05 NPAR BINARY-LONG VALUE 2.
              05 NPRS BINARY-LONG VALUE 1.
           03 COB OCCURS 4 TIMES PIC 9(01) VALUE ZEROS.
           03 PAR OCCURS 3  TIMES BINARY-LONG VALUE ZEROS.
           03 PRS OCCURS 2 TIMES.
              05 ACC OCCURS 8 TIMES BINARY-LONG VALUE ZEROS.

       PROCEDURE DIVISION.
           CALL TRAP OF S14419952 USING 258 8 S14419952
                'SeqWrite'.
           CALL TRAP OF S14419952 USING 260 8 S14419952
                'Begin'
           PERFORM Begin
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'SeqWrite'
           GOBACK.
       Begin.
           ADD  1 TO PAR(1) 
           MOVE 1 TO COB(1) 
           ADD 1 TO ACC OF S14419952(1,1)
           OPEN OUTPUT StudentFile
           DISPLAY "Enter student details using template below. "
           DISPLAY " Enter no data to end."

           CALL TRAP OF S14419952 USING 260 17 S14419952
                'GetStudentDetails' 
           PERFORM GetStudentDetails
           CALL TRAP OF S14419952 USING 261 17 S14419952
                'GetStudentDetails' 
           PERFORM UNTIL StudentDetails = SPACES
           MOVE 1 TO COB(2) 
           ADD 1 TO ACC OF S14419952(1,3)
              WRITE StudentDetails
           CALL TRAP OF S14419952 USING 260 17 S14419952
                'GetStudentDetails' 
              PERFORM GetStudentDetails
           CALL TRAP OF S14419952 USING 261 17 S14419952
                'GetStudentDetails' 
           END-PERFORM
           MOVE 1 TO COB(3) 
           ADD 1 TO ACC OF S14419952(1,2)
           CLOSE StudentFile
           CALL TRAP OF S14419952 USING 259 8 S14419952
                'SeqWrite' 
           STOP RUN.
       
       GetStudentDetails.
           ADD  1 TO PAR(2) 
           MOVE 1 TO COB(4) 
           DISPLAY "Enter - StudId, Surname, Initials, "
           DISPLAY "YOB, MOB, DOB, Course, Gender"
           DISPLAY "NNNNNNNSSSSSSSSIIYYYYMMDDCCCCG"
           ACCEPT  StudentDetails.  
 
