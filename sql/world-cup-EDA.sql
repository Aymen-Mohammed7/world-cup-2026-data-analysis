# Exlpratory Data Analysis


# View total goals for every team in the championship 

SELECT team, SUM(goals) FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team
ORDER BY SUM(goals) DESC;


# Total goals scored vs conceded 

SELECT 
    t.team_id,
    t.team,
    SUM(ms.goals) AS goals_scored,
    SUM(opp.goals) AS goals_conceded
FROM teams t
JOIN match_stats ms ON t.team_id = ms.team_id
JOIN match_stats opp ON ms.match_id = opp.match_id AND ms.team_id != opp.team_id
GROUP BY t.team_id, t.team
ORDER BY goals_scored DESC; 


# View total yellow cards for every team in the championship 

SELECT team, SUM(yellow_cards) FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team
ORDER BY SUM(yellow_cards) DESC;


# Showing average possession for teams that played more than 3 rounds

SELECT team, AVG(possession), COUNT(stats_id) FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team
HAVING COUNT(stats_id) > 3
ORDER BY AVG(possession) DESC;


# Count of matches a player got the player of the match

SELECT player_of_match, COUNT(*) AS player_of_match_count
FROM matches
GROUP BY player_of_match
ORDER BY COUNT(*) DESC;


# The maximum number of goals scored in one match

WITH Max_Goals AS(
SELECT team, MAX(goals) max_goals FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team
ORDER BY MAX(goals) DESC)
SELECT MAX(max_goals) AS goals_scored
FROM MAX_Goals;


# The team that scored maximum number of goals in one match

SELECT t.team, ms.goals AS goals_scored
FROM match_stats ms
JOIN teams t ON ms.team_id = t.team_id
ORDER BY ms.goals DESC
LIMIT 1;


# The team that made maximum number of yellow cards in one match

SELECT t.team, ms.yellow_cards
FROM match_stats ms
JOIN teams t ON ms.team_id = t.team_id
ORDER BY ms.yellow_cards DESC
LIMIT 1;


# The team with the most possession in one match

SELECT t.team, ms.possession
FROM match_stats ms
JOIN teams t ON ms.team_id = t.team_id
ORDER BY ms.possession DESC
LIMIT 1;


# Top 5 highest-scoring teams

SELECT team, SUM(goals) FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team
ORDER BY SUM(goals) DESC
LIMIT 5;


# Team efficiency based on goals to shots ratio

SELECT team, ROUND((SUM(goals) / SUM(shots)) * 100, 2) AS efficiency FROM match_stats
JOIN teams ON match_stats.team_id = teams.team_id
GROUP BY team;


# Data Cleaning

# Updating Jordan continent from Africa to Asia

UPDATE teams
SET continent = 'Asia'
WHERE team = 'Jordan';


# Adding a new column for team's image to the teams table

ALTER TABLE teams ADD COLUMN team_image VARCHAR(150);


# Updating teams table with the new column data

UPDATE teams 
SET team_image = 
    CASE team_id
        WHEN 101 THEN 'https://drive.google.com/thumbnail?id=1Gw-HpHpp2b4xvKYqTpHChH37QuXnhcqf'
        WHEN 102 THEN 'https://drive.google.com/thumbnail?id=1hxkBgiw4sBzt0ztxQChoUxlzYqYPng74'
        WHEN 103 THEN 'https://drive.google.com/thumbnail?id=1B9nXoQqqQ2Sh2sWGUr4EKScQCO8M5BWr'
        WHEN 104 THEN 'https://drive.google.com/thumbnail?id=1e2r6agOlKnN-dh2aq6_euPFZHb_Zgb6N'
        WHEN 105 THEN 'https://drive.google.com/thumbnail?id=15oFIqdpybaYSYkS9hN7t5ZpMYwMZ_-u2'
        WHEN 106 THEN 'https://drive.google.com/thumbnail?id=1wzmxbsXl8mnjlrmBmrvQDg6sjt0nnMfM'
        WHEN 107 THEN 'https://drive.google.com/thumbnail?id=1CUUmrI_2rYInK2em_KWOmv1DFaTsygs1'
        WHEN 108 THEN 'https://drive.google.com/thumbnail?id=15qyingilXMVoIlZ-NtARSUoVhlPxxWNT'
        WHEN 109 THEN 'https://drive.google.com/thumbnail?id=1n6b0HM1y-MDQoDsWYv4sqU9Im8-dkqCy'
        WHEN 110 THEN 'https://drive.google.com/thumbnail?id=1q28kk6FJ1lXMj5prWiNwjvIIjffcHHkG'
        WHEN 111 THEN 'https://drive.google.com/thumbnail?id=1FOludMWZ26aVFUHbD2ZfM-M9mJoEr8_V'
        WHEN 112 THEN 'https://drive.google.com/thumbnail?id=1qbteoZsHviAQpgb8iIR8TsqUHtZpskXO'
        WHEN 113 THEN 'https://drive.google.com/thumbnail?id=1XsoUd56MuzbC4oA9d4YhwEfSsEMfdl60'
        WHEN 114 THEN 'https://drive.google.com/thumbnail?id=1lgJbFhmI2Tsxb9Vpi3r2Pfygj5jaI-LF'
        WHEN 115 THEN 'https://drive.google.com/thumbnail?id=1adlFqMEj1Xj2mXlhbXBmNGE6vhmUQwZn'
        WHEN 116 THEN 'https://drive.google.com/thumbnail?id=1Nq9bkbXC3orbnGZsANF5MVYhk_clvN4H'
        WHEN 117 THEN 'https://drive.google.com/thumbnail?id=15GhvKJPs7wei2GQ53HJKx_zaTNGCvLLn'
        WHEN 118 THEN 'https://drive.google.com/thumbnail?id=1SoAs4kXSUyCaR_HYkbZc9x318VcqDL8P'
        WHEN 119 THEN 'https://drive.google.com/thumbnail?id=1z8I3AsLP6DwnnzzTKbL5e78ChgDYvd9H'
        WHEN 120 THEN 'https://drive.google.com/thumbnail?id=1YfFo-DZzjo1VJKelvH_dKZ6svShMiXW5'
        WHEN 121 THEN 'https://drive.google.com/thumbnail?id=1Tp0f-lw-5Vdfw5uIljvqM7R36BGJLjku'
        WHEN 122 THEN 'https://drive.google.com/thumbnail?id=1eJHPoTXFRcC3nLSXYUQ4GoAZ2_f78fYW'
        WHEN 123 THEN 'https://drive.google.com/thumbnail?id=1-uWB-laRuz7MzwfT4dHXEkBJPmbLg9dM'
        WHEN 124 THEN 'https://drive.google.com/thumbnail?id=1YafmfTxS9QSrtxYmEup-zAwwQFyFmCu_'
        WHEN 125 THEN 'https://drive.google.com/thumbnail?id=113zqzKd5-VQoo44sEkdbNSeuxPp3OOi8'
        WHEN 126 THEN 'https://drive.google.com/thumbnail?id=1Vp3WF2KNghXTdBJZIl6QKudF9ec9FNtm'
        WHEN 127 THEN 'https://drive.google.com/thumbnail?id=1t0oo3EQVh3WdWLjZg7Chlp-COWAaYehg'
        WHEN 128 THEN 'https://drive.google.com/thumbnail?id=1DCyDoKZ8Z4z-LnOkm19E_oRePKZ6kstk'
        WHEN 129 THEN 'https://drive.google.com/thumbnail?id=1mb7FjhXxocftrkiJV1dGEAI77OeSpq-s'
        WHEN 130 THEN 'https://drive.google.com/thumbnail?id=1xZUlLu3VMY7NoaQWopYRnJxZWVR6NX2L'
        WHEN 131 THEN 'https://drive.google.com/thumbnail?id=1yyEsS2P6PQB0JdQQd__tMO0p5lXDDo9v'
        WHEN 132 THEN 'https://drive.google.com/thumbnail?id=1PQQGubYiEovbuTzoBnInTl5ybTWDlP2V'
        WHEN 133 THEN 'https://drive.google.com/thumbnail?id=1oxLXJWMDeiqk8N2Z33aqfYYzUVKgshb7'
        WHEN 134 THEN 'https://drive.google.com/thumbnail?id=1vWTt0TD6DqnV5VTT3VeOzfvXhsfrwXn2'
        WHEN 135 THEN 'https://drive.google.com/thumbnail?id=1SPiD0pDd1kRTE_6SZxswaFJayn65UQ5w'
        WHEN 136 THEN 'https://drive.google.com/thumbnail?id=18C3ptQeKeKg-9wbGNoEp7fESxi-C8TwW'
        WHEN 137 THEN 'https://drive.google.com/thumbnail?id=1WFlPhfcgaIQDE0J4Uo35BdgFRZZnm8Qk'
        WHEN 138 THEN 'https://drive.google.com/thumbnail?id=1AOh8cFMRl48UiT9vl0XCe71UAOjX2IrX'
        WHEN 139 THEN 'https://drive.google.com/thumbnail?id=1geoVDqw-IK7HaAPD6cepM6Jg84vvtm0g'
        WHEN 140 THEN 'https://drive.google.com/thumbnail?id=1Xt4_nPP_Z5xAUmbYEhQ_i_GKEFn7YBRt'
        WHEN 141 THEN 'https://drive.google.com/thumbnail?id=1vQoGpZmFtVgGm38yB8c2slGRF9CcESt4'
        WHEN 142 THEN 'https://drive.google.com/thumbnail?id=1W8l8ii9djclTHZdhBQ-5Pu6rmP0o0DAZ'
        WHEN 143 THEN 'https://drive.google.com/thumbnail?id=17ySUs0d1MTKL7DSLOlydIi-rIrTIptyu'
        WHEN 144 THEN 'https://drive.google.com/thumbnail?id=1Yb7-eDI5USRpC_dW14DS2iJ5LXMhhUDA'
        WHEN 145 THEN 'https://drive.google.com/thumbnail?id=1GQGUGi_FEIM13OsL4uQ8V6fnXvP-0QbV'
        WHEN 146 THEN 'https://drive.google.com/thumbnail?id=1aXkLamY3fxrBvSSEor9ogDO_a3Ymdws2'
        WHEN 147 THEN 'https://drive.google.com/thumbnail?id=1kkwUzN1o_YxlyzJc-3Fc43EtjlXz-wU7'
        WHEN 148 THEN 'https://drive.google.com/thumbnail?id=1Pp9672JtINiVR6f7fEe3uNrNAJqIwC-I'
    END
WHERE team_id IN (101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 
				  113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 
                  125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 
                  137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148);



# Deleting the duplicated data that was inserted accidentally

DELETE FROM matches
WHERE match_id >= 105;


# Adding a new column for player's photo to the matches table

ALTER TABLE matches ADD COLUMN player_photo VARCHAR(150);


# Updating matches table with the new column data

UPDATE matches 
SET player_photo = 
    CASE match_id
        WHEN 1 THEN 'https://drive.google.com/thumbnail?id=1UqicNtKEU_8meS_EkXvA3zaW3HUU3OpZ'
        WHEN 2 THEN 'https://drive.google.com/thumbnail?id=1V6JRncAAt9bNQftFUfG85LXqOzoBFq2-'
        WHEN 3 THEN 'https://drive.google.com/thumbnail?id=1dz6Sen8T0TpwHLXwlfja07Rw5VEnMQmk'
        WHEN 4 THEN 'https://drive.google.com/thumbnail?id=1wvOzjVjjiPIvqYhBkK5bSIu53nWroRP_'
        WHEN 5 THEN 'https://drive.google.com/thumbnail?id=1HRiiT9p1YDkZWT72pT3RdGHPEH0GM4bb'
        WHEN 6 THEN 'https://drive.google.com/thumbnail?id=1Rt9NGG1PYK8igBWdaOSkRIWDyVd_poW-'
        WHEN 7 THEN 'https://drive.google.com/thumbnail?id=1ATmOXJNE3_vTWkR8kijT8WtUyq0mrWfb'
        WHEN 8 THEN 'https://drive.google.com/thumbnail?id=17EAIN6m9RHL3BcK7J9dFLDSaQVeC2B4t'
        WHEN 9 THEN 'https://drive.google.com/thumbnail?id=1pg8IOCwnbw5mGhm-yRB4Qw2WEGvsocth'
        WHEN 10 THEN 'https://drive.google.com/thumbnail?id=1cgLA5vXAtYmNYZ68UGoOESFCrHjldVhE'
        WHEN 11 THEN 'https://drive.google.com/thumbnail?id=1BcwXkY8lzC8Sdux0eyBwTDsCWTIEUTpU'
        WHEN 12 THEN 'https://drive.google.com/thumbnail?id=1-pWJWe2rJbP9DZEkR9_DvBNVIrop-Q9z'
        WHEN 13 THEN 'https://drive.google.com/thumbnail?id=1hBourcaFE5CJEZBkcp0_uLjvg_DvyUgv'
        WHEN 14 THEN 'https://drive.google.com/thumbnail?id=1vUTNe3NIv36-bByJq9r7rM3qQ5LkJwgn'
        WHEN 15 THEN 'https://drive.google.com/thumbnail?id=1yTn8UU8ur-qfjJDXfKjAo9NGNpm79GZu'
        WHEN 16 THEN 'https://drive.google.com/thumbnail?id=14_kdXDDgK-bHpUBcz2wI8fVbBIn0sVnJ'
        WHEN 17 THEN 'https://drive.google.com/thumbnail?id=1QvBmy73SMUsfSaJaH-LF_bkb5Phl3D3x'
        WHEN 18 THEN 'https://drive.google.com/thumbnail?id=1CIGm9UKbnKjNUV2LjFhVkhfjjdyIUh71'
        WHEN 19 THEN 'https://drive.google.com/thumbnail?id=1rZ5ETTeLIHrzFgauqyxLHGPk5voMzHXn'
        WHEN 20 THEN 'https://drive.google.com/thumbnail?id=1Vp4NK4u5J5IfCZX9xVphs8gvH8GYF10I'
        WHEN 21 THEN 'https://drive.google.com/thumbnail?id=1UGTFZ9WtzCXUY2PUqt9D12d_rHvgKMHC'
        WHEN 22 THEN 'https://drive.google.com/thumbnail?id=1mAXLocAqEqLu_IdsWHdyRYEIVO8k-G2_'
        WHEN 23 THEN 'https://drive.google.com/thumbnail?id=12dwuqnfMEfMU7QlMNNNzvekhNbg2Yc_A'
        WHEN 24 THEN 'https://drive.google.com/thumbnail?id=1f79np80LeU1quDLy_Osu-Hwd-aqvOS-R'
        WHEN 25 THEN 'https://drive.google.com/thumbnail?id=1m4D9p16R_WFaqyweHcbJCOltX4PbGvmo'
        WHEN 26 THEN 'https://drive.google.com/thumbnail?id=1LgdONXxUAfK6mHDBcgQqbvhgLQ_vwMXK'
        WHEN 27 THEN 'https://drive.google.com/thumbnail?id=1eOXfYMTQKMZ-ucFKkt7ecculgp2YzcXo'
        WHEN 28 THEN 'https://drive.google.com/thumbnail?id=11vhkYrBtQGZqughhWNWqruowz9Y-7S3I'
        WHEN 29 THEN 'https://drive.google.com/thumbnail?id=1Fr8L3ImGERmP6JJ1_rSz2VaWyNtjyDfh'
        WHEN 30 THEN 'https://drive.google.com/thumbnail?id=1X71W0uAsq_UoZABXn5EJCfbeyA6QkJHV'
        WHEN 31 THEN 'https://drive.google.com/thumbnail?id=1L4D0pxyvXITHqoqFHNyMCWOjj73urBch'
        WHEN 32 THEN 'https://drive.google.com/thumbnail?id=1ol7Zl7lrYiTu2-WtVT3MMIczBe2cu13J'
        WHEN 33 THEN 'https://drive.google.com/thumbnail?id=1qvwsf69RaA2kcMyxyBKik2jJgyZN9sek'
        WHEN 34 THEN 'https://drive.google.com/thumbnail?id=1vz5t_NIcnyUL3LbmDD4vVAF0ty60QHe3'
        WHEN 35 THEN 'https://drive.google.com/thumbnail?id=12FN5TJ7GscvtHHj93S3Chr24fBa-r-cq'
        WHEN 36 THEN 'https://drive.google.com/thumbnail?id=1-qLVJTL7gjxCozO0OHWGaDUZjyRlAWoC'
        WHEN 37 THEN 'https://drive.google.com/thumbnail?id=1_rtQGNumb0cYaTj7ygnFgCP2FJ8ggmUH'
        WHEN 38 THEN 'https://drive.google.com/thumbnail?id=1MbzesaSq-otwDIsQvS8_q6qWT0X2J7TQ'
        WHEN 39 THEN 'https://drive.google.com/thumbnail?id=18EblTRXFvmvLwvLxMsz-ixJDRFs7pD2u'
        WHEN 40 THEN 'https://drive.google.com/thumbnail?id=1t-A1IGwVvF-8iREhxVB2N0dGLSouCvRK'
        WHEN 41 THEN 'https://drive.google.com/thumbnail?id=1Gp5OMXbriP7-7aZEBOM8rHN54oPnFIKi'
        WHEN 42 THEN 'https://drive.google.com/thumbnail?id=1lS4hdXCWoObHBrIFMvpS2QD8K7p19hKq'
        WHEN 43 THEN 'https://drive.google.com/thumbnail?id=1XOmD_uvTH6lJkfmZIhn_RZcdIIVeSobb'
        WHEN 44 THEN 'https://drive.google.com/thumbnail?id=1NMAjl0-fso7Ntu1vt88eP_xi01DZEmcz'
        WHEN 45 THEN 'https://drive.google.com/thumbnail?id=1e6r9QqxrO98NXyR78jig0xaIQ4fUf2gN'
        WHEN 46 THEN 'https://drive.google.com/thumbnail?id=18AJl53Rlhf49X9Q8lCdYQCIQijH06x7X'
        WHEN 47 THEN 'https://drive.google.com/thumbnail?id=13fSSyjvz5rV6Fuccpet6BGfnE9a9yO-2'
        WHEN 48 THEN 'https://drive.google.com/thumbnail?id=1IYjzkvrDcfLpTLwS2-FLRIwdVMHSjCO0'
        WHEN 49 THEN 'https://drive.google.com/thumbnail?id=1D3dV64AU503lrh47IxfUF9M3cyCTqKrA'
        WHEN 50 THEN 'https://drive.google.com/thumbnail?id=1YwHDpF-XPkZC_3OSgpbS0LIXPb0KMHYc'
        WHEN 51 THEN 'https://drive.google.com/thumbnail?id=1HSimatuiwoi0cFHGgUScj8lvQLBtg0Ji'
        WHEN 52 THEN 'https://drive.google.com/thumbnail?id=1ZKcpay9U5U8O14aKUGKBBGH9DcucewZx'
        WHEN 53 THEN 'https://drive.google.com/thumbnail?id=1w5y99rD8mrRBnK_JdQZuwpnIVP8lQEkj'
        WHEN 54 THEN 'https://drive.google.com/thumbnail?id=1Uip9ot3RWr-v7RHnXQiQsFqlyuow6KkL'
        WHEN 55 THEN 'https://drive.google.com/thumbnail?id=1tqHBWDV9ojHBFhubfFZ9HKMNZjky3GOy'
        WHEN 56 THEN 'https://drive.google.com/thumbnail?id=1WIrF9p85fo_iokPBT7GOsFqWa_0fh0uh'
        WHEN 57 THEN 'https://drive.google.com/thumbnail?id=1BxI873nY3ff6-LI3TrqSxZEK4U5m4K8j'
        WHEN 58 THEN 'https://drive.google.com/thumbnail?id=1BI9FPK3sfi647M6ESCSD_gXnI0n1vmcw'
        WHEN 59 THEN 'https://drive.google.com/thumbnail?id=1OJVL576vOtBRfJRbvj4kfkvmAYch84-f'
        WHEN 60 THEN 'https://drive.google.com/thumbnail?id=12R_HfzUCCl1HiavPx2dzzb3gOxty_PUn'
        WHEN 61 THEN 'https://drive.google.com/thumbnail?id=199pVvwcgTJnL_BlLmtlnUDP0GSk2mywg'
        WHEN 62 THEN 'https://drive.google.com/thumbnail?id=1_2ilwEZcUhkDzQSekKxkae_l_l3woTSV'
        WHEN 63 THEN 'https://drive.google.com/thumbnail?id=1UTghLq6DPuoMpvOwWtS8YwFKRZ-YiCMO'
        WHEN 64 THEN 'https://drive.google.com/thumbnail?id=1EL_ZhTT2K8ONLxf61dZgLWqdIQTXN2D1'
        WHEN 65 THEN 'https://drive.google.com/thumbnail?id=1S0TRhw2uAiVGPbiBY1l4myt2a0Ln0SEQ'
        WHEN 66 THEN 'https://drive.google.com/thumbnail?id=1N3FL4uckxYky8qBkDTRzy5p6kQ72dv6G'
        WHEN 67 THEN 'https://drive.google.com/thumbnail?id=1QSiFmx8xiI7tInoi2GEtIUCJNWEVRaUI'
        WHEN 68 THEN 'https://drive.google.com/thumbnail?id=1uE_k2-jjxngSOZeuEAwMankka-YP57kN'
        WHEN 69 THEN 'https://drive.google.com/thumbnail?id=1SXZLeFxiWFqX3clbT8VXwhUEQ3lgb1Jb'
        WHEN 70 THEN 'https://drive.google.com/thumbnail?id=1aaK_6rYEin5FxU9FsyrNtc6ZR4cYxani'
        WHEN 71 THEN 'https://drive.google.com/thumbnail?id=1f94ZPhnQEY7AjiiAE-rJnDkYoaZfDbF_'
        WHEN 72 THEN 'https://drive.google.com/thumbnail?id=1Qc0a6TClY7aRwlSNEfBZYIBd_F9nUi2R'
        WHEN 73 THEN 'https://drive.google.com/thumbnail?id=1n8Z0yno7F2APSTKIZXQj3RpBBcv_PAuk'
        WHEN 74 THEN 'https://drive.google.com/thumbnail?id=1esixsJGyXrYY6l8osVtXs3lt5XW9LTTK'
        WHEN 75 THEN 'https://drive.google.com/thumbnail?id=1E_N0_cNnlfshZIrOQ7cMLBDEkZ_0GsyM'
        WHEN 76 THEN 'https://drive.google.com/thumbnail?id=1eDfY-8FaesxeSJzLj4-WJ7MtD8ZCjI82'
        WHEN 77 THEN 'https://drive.google.com/thumbnail?id=1hlW0LCW5-6MfSN4tmSoxSteQvpdJdWWe'
        WHEN 78 THEN 'https://drive.google.com/thumbnail?id=1xTPpscEeAJ_4P16kSzkOpPofGVxuGLr1'
        WHEN 79 THEN 'https://drive.google.com/thumbnail?id=1LEQTvjlc4p-xGE6D3VL4mglPPLlqpkbh'
        WHEN 80 THEN 'https://drive.google.com/thumbnail?id=1M-HTAeK-XZqcP5C5SgJK9V3mAHIPGKr6'
        WHEN 81 THEN 'https://drive.google.com/thumbnail?id=1T8XvyaCiwACWi-nVKZzEDJSoFAifhxmk'
        WHEN 82 THEN 'https://drive.google.com/thumbnail?id=17KKMONHP17lA0x6Z1Iebd32K_YqDvQCa'
        WHEN 83 THEN 'https://drive.google.com/thumbnail?id=1wdJtppp2oVPZu78f86duHPyw26GV5TVT'
        WHEN 84 THEN 'https://drive.google.com/thumbnail?id=1iI-Q7w0feNnlimpmnN8GYdLcVuMdxiwV'
        WHEN 85 THEN 'https://drive.google.com/thumbnail?id=1G9SGVZpNowNsvoy4kk3gL7a_vYdkh4s-'
        WHEN 86 THEN 'https://drive.google.com/thumbnail?id=1tQv3w947xnI8bdoWb-Y22eIvwHVTlYLM'
        WHEN 87 THEN 'https://drive.google.com/thumbnail?id=1ovdKSf49cdFK9g6-BJ8JiZUYVGSRY5Qe'
        WHEN 88 THEN 'https://drive.google.com/thumbnail?id=14irg4qnMOn0e52kPfGbW32j64S4cuuO3'
        WHEN 89 THEN 'https://drive.google.com/thumbnail?id=1zGft7QevFbyeCoGb3vboCA3mceQvn4R8'
        WHEN 90 THEN 'https://drive.google.com/thumbnail?id=1WFiWro9kVHxPwPqbaEKUbCqm36vVNxIN'
        WHEN 91 THEN 'https://drive.google.com/thumbnail?id=12ozIX3h5mKeBIV1-jGdz0FkPCZClILXi'
        WHEN 92 THEN 'https://drive.google.com/thumbnail?id=1TxMKGfDXBzOdxJtn4I_APL_esMJ5C6XN'
        WHEN 93 THEN 'https://drive.google.com/thumbnail?id=1KzR0vsqnYYcXxsEI2AX56eSOR-sxEwz_'
        WHEN 94 THEN 'https://drive.google.com/thumbnail?id=1kX12EnjHF3IMNhSogsNwoWp17L1rIZUu'
        WHEN 95 THEN 'https://drive.google.com/thumbnail?id=1ZGACV97FPtkEvUktqeQLwrkXJKRHzikS'
        WHEN 96 THEN 'https://drive.google.com/thumbnail?id=1x8fOgwfOmCDi7W5llXpv71LHFu1nxpSa'
        WHEN 97 THEN 'https://drive.google.com/thumbnail?id=1kQV0PlmLxpXMlsKJnIjWpdy1TheQYkw5'
        WHEN 98 THEN 'https://drive.google.com/thumbnail?id=1OiOqAIRO0TvDBp7meHFvB4s19Pje5EVo'
        WHEN 99 THEN 'https://drive.google.com/thumbnail?id=1OfVLIhoIodwrAjsAQKI1I_FO0ANwfCWr'
        WHEN 100 THEN 'https://drive.google.com/thumbnail?id=1hqG-htyUbbLCnRNelA8arJ4shu0dUKuo'
        WHEN 101 THEN 'https://drive.google.com/thumbnail?id=1oYK6DcGCDIn3FdnTyJA596VJCyUdUbQN'
        WHEN 102 THEN 'https://drive.google.com/thumbnail?id=1CdXmsN_GXh5fvhVqjozkHXWKdDwTYWTi'
        WHEN 103 THEN 'https://drive.google.com/thumbnail?id=1mgacwWmq_YV-H1R_zzKFOx4pyPOHh8xG'
        WHEN 104 THEN 'https://drive.google.com/thumbnail?id=163pJ4gcCEwt7M2TtA03pt_4EIcFMtDZa'
    END
WHERE match_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 
				   21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 
                   39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 
                   57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 
                   75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 
                   93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104);


# Updating some values from round column (1, 2, 3) to Groups

UPDATE matches
SET `round` = 'Groups'
WHERE `round` IN ('1', '2', '3');


# Updaing player name

UPDATE matches
SET player_of_match = 'Vinicius Junior'
WHERE player_of_match = 'Vincius Junior';


# Updating team name from teams table

UPDATE teams
SET team = 'Morocco'
WHERE team = 'Moroco';


# Updating team name from matches table

UPDATE matches
SET home = 'Morocco'
WHERE home = 'Moroco';

UPDATE matches
SET away = 'Morocco'
WHERE away = 'Moroco';


SELECT * FROM matches;

