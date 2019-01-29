# Create an empty array of 9 to simulate a 3x3 board
$Board = (' ',' ',' ',' ',' ',' ',' ',' ',' ')

# Label available board positions
$BoardPositions = (0,1,2,3,4,5,6,7,8)

# Create an empty array this helped with looping
$newBoardPositions = @()

# Sterotypical X and O players, feel free to change
$Players = ('X','O')

function GetBoard {
  # GetBoard function, displays the current board in console 
  # | | | |
  # | | | |
  # | | | |
  #
  param (
    [array]$Board
  )

  $FirstRow = '|' + $Board[0] + '|' + $Board[1] + '|' + $Board[2] + '|'

  $SecondRow = '|' + $Board[3] + '|' + $Board[4] + '|' + $Board[5] + '|'

  $ThirdRow = '|' + $Board[6] + '|' + $Board[7] + '|' + $Board[8] + '|'  

  Write-Output $FirstRow

  Write-Output $SecondRow

  Write-Output $ThirdRow 
}

function MakeBoardMove {

  param (
    [array]$Board,
    [array]$newBoardPositions,
    [array]$BoardPositions,
    [string]$Player
  )
  
  $newBoardPositions = @()

  #$Position = Get-Random -Maximum $BoardPositions.Length -Minimum 0

  Write-Host " Position Picked: " $BoardPositions[$Position]

  foreach ($BoardPosition in $BoardPositions)
  {
    if ($BoardPosition -eq $BoardPositions[$Position]){
      $BoardPositionPicked = $BoardPosition
    }
    elseif ($BoardPosition -ne $BoardPositions[$Position]){
      $newBoardPositions = $newBoardPositions += $BoardPosition
    }
  }

  $Board[$BoardPositionPicked] = $Player

  $BoardPositions = $newBoardPositions

  return $newBoardPositions
}

function GetPlayers {
  param (
    # Parameter help description
    [array]$Players
  )
  $Rand = Get-Random -Maximum 2 -Minimum 0

  if ($Rand -eq 0) {
    $FirstPlayer = 0
    $SecondPlayer = 1
  } else {
    $FirstPlayer = 1
    $SecondPlayer = 0
  }

  $FirstPlayer = $Players[$FirstPlayer]
  $SecondPlayer = $Players[$SecondPlayer]

  return ($FirstPlayer, $SecondPlayer)
}

function CheckWinner {
  param (
    [array]$Board
  )

  if (($Board[0] -eq $Board[1]) -and ($Board[1] -eq $Board[2]) -and $Board[0] -ne ' ' -and $Board[1] -ne ' ' -and $Board[2] -ne ' ') {
    write-host "Winner First Row"
    write-host "Winner is"$Board[0]
    exit

  } elseif (($Board[3] -eq $Board[4]) -and ($Board[4] -eq $Board[5]) -and $Board[3] -ne ' ' -and $Board[4] -ne ' ' -and $Board[5] -ne ' ') {
    write-host "Winner Second Row"
    write-host "Winner is"$Board[3]
    exit

  } elseif (($Board[6] -eq $Board[7]) -and ($Board[7] -eq $Board[8]) -and $Board[6] -ne ' ' -and $Board[7] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Third Row"
    write-host "Winner is"$Board[6]
    exit

  } elseif (($Board[0] -eq $Board[3]) -and ($Board[3] -eq $Board[6]) -and $Board[0] -ne ' ' -and $Board[3] -ne ' ' -and $Board[6] -ne ' ') {
    write-host "Winner First Column"
    write-host "Winner is"$Board[0]
    exit

  } elseif (($Board[1] -eq $Board[4]) -and ($Board[4] -eq $Board[7]) -and $Board[1] -ne ' ' -and $Board[4] -ne ' ' -and $Board[7] -ne ' ') {
    write-host "Winner Second Column"
    write-host "Winner is"$Board[1]
    exit

  } elseif (($Board[2] -eq $Board[5]) -and ($Board[5] -eq $Board[8]) -and $Board[2] -ne ' ' -and $Board[5] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Third Column"
    write-host "Winner is"$Board[2]
    exit

  } elseif (($Board[0] -eq $Board[4]) -and ($Board[4] -eq $Board[8])  -and $Board[0] -ne ' ' -and $Board[4] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Top Left Diagonal"
    write-host "Winner is"$Board[0]
    exit

  } elseif (($Board[6] -eq $Board[4]) -and ($Board[4] -eq $Board[2])  -and $Board[4] -ne ' ' -and $Board[2] -ne ' ' -and $Board[0] -ne ' ') {
    write-host "Winner Bottom Left Diagonal"
    write-host "Winner is"$Board[6]
    exit
  }
  
}

function ClearBoard {
  Start-Sleep -Seconds 2
  Clear-Host  
}


$SelectPlayerOrder = GetPlayers $Players

$FirstPlayer = $SelectPlayerOrder[0]
$SecondPlayer = $SelectPlayerOrder[1]

write-host First Player: $FirstPlayer
write-host Second Player: $SecondPlayer

GetBoard $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $BoardPositions -Player $FirstPlayer -newBoardPositions $newBoardPositions
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer -newBoardPositions $newBoardPositions
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board
ClearBoard

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board

Write-host "Stalemate"

