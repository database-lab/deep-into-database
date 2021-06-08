SELECT
  RANK() OVER(ORDER BY points DESC) AS rank,
  DENSE_RANK() OVER(ORDER BY points DESC) AS dense_rank,
  ROW_NUMBER() OVER(ORDER BY points DESC) AS row_number,
  first_name,
  last_name,
  points
FROM exam_result;