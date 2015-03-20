-- Le faire avec x de 2 à 10

UPDATE orni_question
SET Id_sous_niveau = x
WHERE Id_question IN (SELECT *
             FROM (SELECT Id_question
                   FROM orni_question
                   ORDER BY Id_question
                   LIMIT (x-1)00, 100) AS t)