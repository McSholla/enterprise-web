DELIMITER //
CREATE OR REPLACE PROCEDURE Get_report_data(IN START_DATE DATE, IN END_DATE DATE)
    READS SQL DATA
BEGIN
    #faculties year overview
    SELECT F.ID        AS FACULTY_ID,
           F.NAME      AS FACULTY_NAME,
           Y.ID        AS YEAR_ID,
           Y.STARTDATE AS YEAR_START,
           Y.ENDDATE   AS YEAR_END,
           count(CASE WHEN LOWER(U.ROLE) = 'student' THEN 1 ELSE NULL END)
                       AS N_STUDENT,
           count(DISTINCT (S.AUTHOR_ID))
                       AS N_CONTRIBUTOR,
           count(S.ID)
                       AS N_SUBMISSION,
           count(CASE WHEN S.IS_SELECTED = TRUE THEN 1 ELSE NULL END)
                       AS N_SUBMISSION_SELECTED,
           count(CASE WHEN TRIM(S.COMMENT) = '' THEN 1 ELSE NULL END)
                       AS N_SUBMISSION_WO_COMMENT
    FROM Year Y
             JOIN Submission S ON Y.ID = S.YEAR_ID
             JOIN User U ON S.AUTHOR_ID = U.ID
             JOIN Faculty F ON U.FACULTY_ID = F.ID
    WHERE Y.STARTDATE >= START_DATE
      AND Y.ENDDATE <= END_DATE
    GROUP BY Y.ID, F.ID;

    #top student
#     SELECT Y2.ID        AS YEAR_ID,
#            Y2.STARTDATE AS YEAR_START,
#            Y2.ENDDATE   AS YEAR_END,
#            U2.ID,
#            U2.FACULTY_ID,
#            U2.EMAIL,
#            COUNT(S2.ID) AS N_SELECTED
#     FROM USER U2
#              JOIN SUBMISSION S2 ON U2.ID = S2.AUTHOR_ID
#              JOIN YEAR Y2 ON S2.YEAR_ID = Y2.ID
#     WHERE LOWER(U2.ROLE) = 'student'
#       AND S2.IS_SELECTED = TRUE
#       AND Y2.STARTDATE >= START_DATE
#       AND Y2.ENDDATE <= END_DATE
#     GROUP BY Y2.ID, U2.ID
#     ORDER BY N_SELECTED
#         DESC
#     LIMIT 10;

END;
//
DELIMITER ;

CALL Get_report_data('2016-1-1', '2019-12-31');

