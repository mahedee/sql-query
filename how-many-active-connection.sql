-------------Check How many active connection open-----------------

--- Select database ---

SELECT

                hostname AS [Client],

                program_name AS [Client Application],

                DB_NAME(dbid) AS [Database Name],

                COUNT(dbid) AS [Number of Connections],

                UPPER(loginame) AS [Login or UserID],
				dbid

FROM

                sys.sysprocesses

WHERE

                dbid > 0 AND DB_NAME(dbid) NOT IN ('master','model','msdb','tempdb')

GROUP BY

                hostname,

                program_name,

                dbid,

                loginame

ORDER BY

                [Number of Connections] desc