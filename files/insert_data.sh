#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# function getTeamId() {
#     # check if winner and opponnet team_id
#      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"

#      #if winner_id not found
#      if [[ -z $WINNER_ID ]]
#      then
#         #INSERT TO  team teams db
#         INSERT_WINNER_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$1')")"
#         if [[ $INSERT_WINNER_TEAM="INSERT 0 1" ]]
#         then
#            echo "adding new team name:$1 to teams db"
#            #GET_WINNER_ID
#            WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
#      fi
#       return $WINNER_ID
#   }
cat games.csv | while IFS="," read  year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" ]]
  then
      # check if winner and opponnet team_id
     WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
      #if winner_id not found
     if [[ -z $WINNER_ID ]]

     then
        echo "TEAM NOT FOUND NEED TO INSERT"
        #INSERT TO  team teams db
        INSERT_WINNER_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$winner')")"
        if [[ $INSERT_WINNER_TEAM="INSERT 0 1" ]]
        then
           echo "adding new team name:$winner to teams db"
           #GET_WINNER_ID
           WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
        fi
      fi
    
      # check if winner and opponnet team_id
     OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
      #if winner_id not found
     if [[ -z $OPPONENT_ID ]]
     then
        #INSERT TO  team teams db
        INSERT_OPPONENT_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")"
        if [[ $INSERT_OPPONENT_TEAM="INSERT 0 1" ]]
        then
           echo "adding new team name:$opponent to teams db"
           #GET_OPPONENT_ID
           OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
        fi
     fi
    echo $WINNER_ID $OPPONENT_ID
    INSERT_TO_GAME="$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($year,'$round',$WINNER_ID,$OPPONENT_ID,$winner_goals,$opponent_goals)")"
    if [[ $INSERT_TO_GAME = 'INSERT 0 1' ]]
    then
      echo "New game inserted..." 
    fi     
  fi
done



# Do not change code above this line. Use the PSQL variable above to query your database.
