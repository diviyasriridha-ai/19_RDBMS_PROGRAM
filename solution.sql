-- Create Student Table
CREATE TABLE Student (
    StudentID NUMBER(5),
    StudentName VARCHAR2(30),
    DepartmentID NUMBER(5)
);

-- Insert Records
INSERT INTO Student VALUES (1001, 'Arun', 101);
INSERT INTO Student VALUES (1002, 'Karthik', 102);
INSERT INTO Student VALUES (1003, 'Divya', 103);

COMMIT;

-- Cursor Program
DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_id Student.StudentID%TYPE;
    v_name Student.StudentName%TYPE;
    v_dept Student.DepartmentID%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor INTO v_id, v_name, v_dept;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'StudentID: ' || v_id ||
            '  StudentName: ' || v_name ||
            '  DepartmentID: ' || v_dept
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
