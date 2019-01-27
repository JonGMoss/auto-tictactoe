$Board = (' ',' ',' ',' ',' ',' ',' ',' ',' ')

$BoardPositions = (0,1,2,3,4,5,6,7,8)

$newBoardPositions = @()

$Players = ('X','O')

function GetBoard {
  param (
    # Parameter help description
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
  
  Write-host "called func:MakeBoardMove"

  $newBoardPositions = @()

  write-host $BoardPositions

  $Position = Get-Random -Maximum $BoardPositions.Length -Minimum 0

  Write-Host " Position Picked: " $BoardPositions[$Position]

  Write-Host "  Original Board Position = $BoardPositions"

  foreach ($BoardPosition in $BoardPositions)
  {
    if ($BoardPosition -eq $BoardPositions[$Position]){
      $BoardPositionPicked = $BoardPosition
    }
    elseif ($BoardPosition -ne $BoardPositions[$Position]){
      #$BoardPosition = New-Object PSObject –Property $BoardPosition
      $newBoardPositions = $newBoardPositions += $BoardPosition
      #Write-Host $newBoardPositions
    }
  }

  Write-Host "  New Board Position = $newBoardPositions"

  #$Board[$RandStart] = $FirstPlayer

  $Board[$BoardPositionPicked] = $Player

  $BoardPositions = $newBoardPositions

  Write-Host "  Original Board Position = $BoardPositions"

  Write-Host "end func: MakeBoardMove" 
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
    $Board[0]
    $Board[1]
    $Board[2]
    exit

  } elseif (($Board[3] -eq $Board[4]) -and ($Board[4] -eq $Board[5]) -and $Board[3] -ne ' ' -and $Board[4] -ne ' ' -and $Board[5] -ne ' ') {
    write-host "Winner Second Row"
    $Board[3]
    $Board[4]
    $Board[5]
    exit

  } elseif (($Board[6] -eq $Board[7]) -and ($Board[7] -eq $Board[8]) -and $Board[6] -ne ' ' -and $Board[7] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Third Row"
    $Board[6]
    $Board[7]
    $Board[8]
    exit

  } elseif (($Board[0] -eq $Board[3]) -and ($Board[3] -eq $Board[6]) -and $Board[0] -ne ' ' -and $Board[3] -ne ' ' -and $Board[6] -ne ' ') {
    write-host "Winner First Column"
    $Board[0]
    $Board[3]
    $Board[6]
    exit

  } elseif (($Board[1] -eq $Board[4]) -and ($Board[4] -eq $Board[7]) -and $Board[1] -ne ' ' -and $Board[4] -ne ' ' -and $Board[7] -ne ' ') {
    write-host "Winner Second Column"
    $Board[1]
    $Board[4]
    $Board[7]
    exit

  } elseif (($Board[2] -eq $Board[5]) -and ($Board[5] -eq $Board[8]) -and $Board[2] -ne ' ' -and $Board[5] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Third Column"
    $Board[2]
    $Board[5]
    $Board[8]
    exit

  } elseif (($Board[0] -eq $Board[4]) -and ($Board[4] -eq $Board[8])  -and $Board[0] -ne ' ' -and $Board[4] -ne ' ' -and $Board[8] -ne ' ') {
    write-host "Winner Top Left Diagonal"
    $Board[0]
    $Board[4] 
    $Board[8]
    exit

  } elseif (($Board[6] -eq $Board[4]) -and ($Board[4] -eq $Board[2])  -and $Board[4] -ne ' ' -and $Board[2] -ne ' ' -and $Board[0] -ne ' ') {
    write-host "Winner Bottom Left Diagonal"
    $Board[6]
    $Board[4]
    $Board[2]
    exit
  }
  
}

$SelectPlayerOrder = GetPlayers $Players

$FirstPlayer = $SelectPlayerOrder[0]
$SecondPlayer = $SelectPlayerOrder[1]

write-host First Player: $FirstPlayer
write-host Second Player: $SecondPlayer

GetBoard $Board

#$RandStart = Get-Random -Maximum 8 -Minimum 0

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $BoardPositions -Player $FirstPlayer -newBoardPositions $newBoardPositions
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer -newBoardPositions $newBoardPositions
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $FirstPlayer
GetBoard $Board
CheckWinner $Board

$newBoardPositions = MakeBoardMove -Board $Board -BoardPositions $newBoardPositions -Player $SecondPlayer
GetBoard $Board
CheckWinner $Board


#$Board[$RandStart] = $FirstPlayer

function ClearBoard {
  Start-Sleep -Seconds 2
  Clear-Host  
}
