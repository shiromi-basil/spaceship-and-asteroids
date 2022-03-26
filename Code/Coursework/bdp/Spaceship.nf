Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Spaceship))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Spaceship))==(Machine(Spaceship));
  Level(Machine(Spaceship))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Spaceship)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Spaceship))==(Space)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Spaceship))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Spaceship))==(?);
  List_Includes(Machine(Spaceship))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Spaceship))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Spaceship))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Spaceship))==(?);
  Context_List_Variables(Machine(Spaceship))==(?);
  Abstract_List_Variables(Machine(Spaceship))==(?);
  Local_List_Variables(Machine(Spaceship))==(regionsVisited,noOfAsteroidCollisions,currentPower,yAxis,xAxis);
  List_Variables(Machine(Spaceship))==(regionsVisited,noOfAsteroidCollisions,currentPower,yAxis,xAxis);
  External_List_Variables(Machine(Spaceship))==(regionsVisited,noOfAsteroidCollisions,currentPower,yAxis,xAxis)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Spaceship))==(?);
  Abstract_List_VisibleVariables(Machine(Spaceship))==(?);
  External_List_VisibleVariables(Machine(Spaceship))==(?);
  Expanded_List_VisibleVariables(Machine(Spaceship))==(?);
  List_VisibleVariables(Machine(Spaceship))==(?);
  Internal_List_VisibleVariables(Machine(Spaceship))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Spaceship))==(btrue);
  Gluing_List_Invariant(Machine(Spaceship))==(btrue);
  Expanded_List_Invariant(Machine(Spaceship))==(btrue);
  Abstract_List_Invariant(Machine(Spaceship))==(btrue);
  Context_List_Invariant(Machine(Spaceship))==(btrue);
  List_Invariant(Machine(Spaceship))==(xAxis: NAT1 & xAxis: spaceXAxis & yAxis: NAT1 & yAxis: spaceYAxis & xAxis|->yAxis: space & xAxis|->yAxis: emptyRegion & currentPower: INTEGER & noOfAsteroidCollisions: NAT & regionsVisited: seq(space) & regionsVisited: seq(emptyRegion))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Spaceship))==(btrue);
  Abstract_List_Assertions(Machine(Spaceship))==(btrue);
  Context_List_Assertions(Machine(Spaceship))==(btrue);
  List_Assertions(Machine(Spaceship))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Spaceship))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Spaceship))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Spaceship))==(xAxis,yAxis,currentPower,noOfAsteroidCollisions,regionsVisited:=1,1,100,0,[1|->1]);
  Context_List_Initialisation(Machine(Spaceship))==(skip);
  List_Initialisation(Machine(Spaceship))==(xAxis:=1 || yAxis:=1 || currentPower:=100 || noOfAsteroidCollisions:=0 || regionsVisited:=[1|->1])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Spaceship))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Spaceship),Machine(Space))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Spaceship))==(btrue);
  List_Constraints(Machine(Spaceship))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Spaceship))==(NewGame,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus);
  List_Operations(Machine(Spaceship))==(NewGame,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus)
END
&
THEORY ListInputX IS
  List_Input(Machine(Spaceship),NewGame)==(power);
  List_Input(Machine(Spaceship),MoveUp)==(?);
  List_Input(Machine(Spaceship),MoveDown)==(?);
  List_Input(Machine(Spaceship),MoveForward)==(?);
  List_Input(Machine(Spaceship),MoveBackward)==(?);
  List_Input(Machine(Spaceship),EngageWarpDrive)==(newXAxis,newYAxis);
  List_Input(Machine(Spaceship),MissionStatus)==(?);
  List_Input(Machine(Spaceship),RegionsVisited)==(?);
  List_Input(Machine(Spaceship),DockedAtStarbase)==(?);
  List_Input(Machine(Spaceship),GameStatus)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Spaceship),NewGame)==(?);
  List_Output(Machine(Spaceship),MoveUp)==(report);
  List_Output(Machine(Spaceship),MoveDown)==(report);
  List_Output(Machine(Spaceship),MoveForward)==(report);
  List_Output(Machine(Spaceship),MoveBackward)==(report);
  List_Output(Machine(Spaceship),EngageWarpDrive)==(report);
  List_Output(Machine(Spaceship),MissionStatus)==(currentLocation,currentPowerReserve,totalAsteroidCollisions);
  List_Output(Machine(Spaceship),RegionsVisited)==(regions);
  List_Output(Machine(Spaceship),DockedAtStarbase)==(dockedStatus);
  List_Output(Machine(Spaceship),GameStatus)==(gameStatus)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Spaceship),NewGame)==(NewGame(power));
  List_Header(Machine(Spaceship),MoveUp)==(report <-- MoveUp);
  List_Header(Machine(Spaceship),MoveDown)==(report <-- MoveDown);
  List_Header(Machine(Spaceship),MoveForward)==(report <-- MoveForward);
  List_Header(Machine(Spaceship),MoveBackward)==(report <-- MoveBackward);
  List_Header(Machine(Spaceship),EngageWarpDrive)==(report <-- EngageWarpDrive(newXAxis,newYAxis));
  List_Header(Machine(Spaceship),MissionStatus)==(currentLocation,currentPowerReserve,totalAsteroidCollisions <-- MissionStatus);
  List_Header(Machine(Spaceship),RegionsVisited)==(regions <-- RegionsVisited);
  List_Header(Machine(Spaceship),DockedAtStarbase)==(dockedStatus <-- DockedAtStarbase);
  List_Header(Machine(Spaceship),GameStatus)==(gameStatus <-- GameStatus)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Spaceship),NewGame)==(power: NAT);
  List_Precondition(Machine(Spaceship),MoveUp)==(report: MOVEMENT_REPORT);
  List_Precondition(Machine(Spaceship),MoveDown)==(report: MOVEMENT_REPORT);
  List_Precondition(Machine(Spaceship),MoveForward)==(report: MOVEMENT_REPORT);
  List_Precondition(Machine(Spaceship),MoveBackward)==(report: MOVEMENT_REPORT);
  List_Precondition(Machine(Spaceship),EngageWarpDrive)==(report: MOVEMENT_REPORT & newXAxis: NAT1 & newXAxis: spaceXAxis & newYAxis: NAT1 & newYAxis: spaceYAxis);
  List_Precondition(Machine(Spaceship),MissionStatus)==(btrue);
  List_Precondition(Machine(Spaceship),RegionsVisited)==(btrue);
  List_Precondition(Machine(Spaceship),DockedAtStarbase)==(dockedStatus: DOCKED_STATUS);
  List_Precondition(Machine(Spaceship),GameStatus)==(gameStatus: GAME_STATUS)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Spaceship),GameStatus)==(gameStatus: GAME_STATUS | xAxis|->yAxis = starbase ==> gameStatus:=GameWon [] not(xAxis|->yAxis = starbase) ==> (currentPower<normalMovementPower ==> gameStatus:=GameLost [] not(currentPower<normalMovementPower) ==> gameStatus:=GameNotOver));
  Expanded_List_Substitution(Machine(Spaceship),DockedAtStarbase)==(dockedStatus: DOCKED_STATUS | xAxis|->yAxis = starbase ==> dockedStatus:=SpaceshipDockedAtStarbase [] not(xAxis|->yAxis = starbase) ==> dockedStatus:=SpaceshipNotDockedAtStarbase);
  Expanded_List_Substitution(Machine(Spaceship),RegionsVisited)==(btrue | regions:=regionsVisited);
  Expanded_List_Substitution(Machine(Spaceship),MissionStatus)==(btrue | currentLocation,currentPowerReserve,totalAsteroidCollisions:=xAxis|->yAxis,currentPower,noOfAsteroidCollisions);
  Expanded_List_Substitution(Machine(Spaceship),EngageWarpDrive)==(report: MOVEMENT_REPORT & newXAxis: NAT1 & newXAxis: spaceXAxis & newYAxis: NAT1 & newYAxis: spaceYAxis | not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) ==> (currentPower>=warpDriveMovementPower ==> (newXAxis|->newYAxis: space ==> (not(newXAxis = xAxis & newYAxis = yAxis) ==> (not(newXAxis|->newYAxis: asteroids) ==> xAxis,yAxis,currentPower,regionsVisited,report:=newXAxis,newYAxis,currentPower-warpDriveMovementPower,regionsVisited<-(newXAxis|->newYAxis),WarpSuccessful [] not(not(newXAxis|->newYAxis: asteroids)) ==> currentPower,noOfAsteroidCollisions,report:=currentPower-asteroidCollisionPower,noOfAsteroidCollisions+1,WarpError_OccupiedByAsteroid) [] not(not(newXAxis = xAxis & newYAxis = yAxis)) ==> report:=WarpError_UnableToWarpToTheSameRegion) [] not(newXAxis|->newYAxis: space) ==> report:=WarpError_OutOfBounds) [] not(currentPower>=warpDriveMovementPower) ==> report:=WarpError_InsufficientPower) [] not(not(xAxis|->yAxis = starbase or currentPower<normalMovementPower)) ==> report:=GameOverRestartTheGame);
  Expanded_List_Substitution(Machine(Spaceship),MoveBackward)==(report: MOVEMENT_REPORT | not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) ==> (currentPower>=normalMovementPower ==> (pred(xAxis)|->yAxis: space ==> (not(pred(xAxis)|->yAxis: asteroids) ==> xAxis,currentPower,regionsVisited,report:=pred(xAxis),currentPower-normalMovementPower,regionsVisited<-(pred(xAxis)|->yAxis),MovementSuccessful [] not(not(pred(xAxis)|->yAxis: asteroids)) ==> currentPower,noOfAsteroidCollisions,report:=currentPower-asteroidCollisionPower,noOfAsteroidCollisions+1,MovementError_OccupiedByAsteriod) [] not(pred(xAxis)|->yAxis: space) ==> report:=MovementError_OutOfBounds) [] not(currentPower>=normalMovementPower) ==> report:=MovementError_InsufficientPower) [] not(not(xAxis|->yAxis = starbase or currentPower<normalMovementPower)) ==> report:=GameOverRestartTheGame);
  Expanded_List_Substitution(Machine(Spaceship),MoveForward)==(report: MOVEMENT_REPORT | not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) ==> (currentPower>=normalMovementPower ==> (succ(xAxis)|->yAxis: space ==> (not(succ(xAxis)|->yAxis: asteroids) ==> xAxis,currentPower,regionsVisited,report:=succ(xAxis),currentPower-normalMovementPower,regionsVisited<-(succ(xAxis)|->yAxis),MovementSuccessful [] not(not(succ(xAxis)|->yAxis: asteroids)) ==> currentPower,noOfAsteroidCollisions,report:=currentPower-asteroidCollisionPower,noOfAsteroidCollisions+1,MovementError_OccupiedByAsteriod) [] not(succ(xAxis)|->yAxis: space) ==> report:=MovementError_OutOfBounds) [] not(currentPower>=normalMovementPower) ==> report:=MovementError_InsufficientPower) [] not(not(xAxis|->yAxis = starbase or currentPower<normalMovementPower)) ==> report:=GameOverRestartTheGame);
  Expanded_List_Substitution(Machine(Spaceship),MoveDown)==(report: MOVEMENT_REPORT | not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) ==> (currentPower>=normalMovementPower ==> (xAxis|->pred(yAxis): space ==> (not(xAxis|->pred(yAxis): asteroids) ==> yAxis,currentPower,regionsVisited,report:=pred(yAxis),currentPower-normalMovementPower,regionsVisited<-(xAxis|->pred(yAxis)),MovementSuccessful [] not(not(xAxis|->pred(yAxis): asteroids)) ==> currentPower,noOfAsteroidCollisions,report:=currentPower-asteroidCollisionPower,noOfAsteroidCollisions+1,MovementError_OccupiedByAsteriod) [] not(xAxis|->pred(yAxis): space) ==> report:=MovementError_OutOfBounds) [] not(currentPower>=normalMovementPower) ==> report:=MovementError_InsufficientPower) [] not(not(xAxis|->yAxis = starbase or currentPower<normalMovementPower)) ==> report:=GameOverRestartTheGame);
  Expanded_List_Substitution(Machine(Spaceship),MoveUp)==(report: MOVEMENT_REPORT | not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) ==> (currentPower>=normalMovementPower ==> (xAxis|->succ(yAxis): space ==> (not(xAxis|->succ(yAxis): asteroids) ==> yAxis,currentPower,regionsVisited,report:=succ(yAxis),currentPower-normalMovementPower,regionsVisited<-(xAxis|->succ(yAxis)),MovementSuccessful [] not(not(xAxis|->succ(yAxis): asteroids)) ==> currentPower,noOfAsteroidCollisions,report:=currentPower-asteroidCollisionPower,noOfAsteroidCollisions+1,MovementError_OccupiedByAsteriod) [] not(xAxis|->succ(yAxis): space) ==> report:=MovementError_OutOfBounds) [] not(currentPower>=normalMovementPower) ==> report:=MovementError_InsufficientPower) [] not(not(xAxis|->yAxis = starbase or currentPower<normalMovementPower)) ==> report:=GameOverRestartTheGame);
  Expanded_List_Substitution(Machine(Spaceship),NewGame)==(power: NAT | xAxis,yAxis,currentPower,noOfAsteroidCollisions,regionsVisited:=1,1,power,0,[1|->1]);
  List_Substitution(Machine(Spaceship),NewGame)==(xAxis:=1 || yAxis:=1 || currentPower:=power || noOfAsteroidCollisions:=0 || regionsVisited:=[1|->1]);
  List_Substitution(Machine(Spaceship),MoveUp)==(IF not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) THEN IF currentPower>=normalMovementPower THEN IF xAxis|->succ(yAxis): space THEN IF not(xAxis|->succ(yAxis): asteroids) THEN yAxis:=succ(yAxis) || currentPower:=currentPower-normalMovementPower || regionsVisited:=regionsVisited<-(xAxis|->succ(yAxis)) || report:=MovementSuccessful ELSE currentPower:=currentPower-asteroidCollisionPower || noOfAsteroidCollisions:=noOfAsteroidCollisions+1 || report:=MovementError_OccupiedByAsteriod END ELSE report:=MovementError_OutOfBounds END ELSE report:=MovementError_InsufficientPower END ELSE report:=GameOverRestartTheGame END);
  List_Substitution(Machine(Spaceship),MoveDown)==(IF not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) THEN IF currentPower>=normalMovementPower THEN IF xAxis|->pred(yAxis): space THEN IF not(xAxis|->pred(yAxis): asteroids) THEN yAxis:=pred(yAxis) || currentPower:=currentPower-normalMovementPower || regionsVisited:=regionsVisited<-(xAxis|->pred(yAxis)) || report:=MovementSuccessful ELSE currentPower:=currentPower-asteroidCollisionPower || noOfAsteroidCollisions:=noOfAsteroidCollisions+1 || report:=MovementError_OccupiedByAsteriod END ELSE report:=MovementError_OutOfBounds END ELSE report:=MovementError_InsufficientPower END ELSE report:=GameOverRestartTheGame END);
  List_Substitution(Machine(Spaceship),MoveForward)==(IF not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) THEN IF currentPower>=normalMovementPower THEN IF succ(xAxis)|->yAxis: space THEN IF not(succ(xAxis)|->yAxis: asteroids) THEN xAxis:=succ(xAxis) || currentPower:=currentPower-normalMovementPower || regionsVisited:=regionsVisited<-(succ(xAxis)|->yAxis) || report:=MovementSuccessful ELSE currentPower:=currentPower-asteroidCollisionPower || noOfAsteroidCollisions:=noOfAsteroidCollisions+1 || report:=MovementError_OccupiedByAsteriod END ELSE report:=MovementError_OutOfBounds END ELSE report:=MovementError_InsufficientPower END ELSE report:=GameOverRestartTheGame END);
  List_Substitution(Machine(Spaceship),MoveBackward)==(IF not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) THEN IF currentPower>=normalMovementPower THEN IF pred(xAxis)|->yAxis: space THEN IF not(pred(xAxis)|->yAxis: asteroids) THEN xAxis:=pred(xAxis) || currentPower:=currentPower-normalMovementPower || regionsVisited:=regionsVisited<-(pred(xAxis)|->yAxis) || report:=MovementSuccessful ELSE currentPower:=currentPower-asteroidCollisionPower || noOfAsteroidCollisions:=noOfAsteroidCollisions+1 || report:=MovementError_OccupiedByAsteriod END ELSE report:=MovementError_OutOfBounds END ELSE report:=MovementError_InsufficientPower END ELSE report:=GameOverRestartTheGame END);
  List_Substitution(Machine(Spaceship),EngageWarpDrive)==(IF not(xAxis|->yAxis = starbase or currentPower<normalMovementPower) THEN IF currentPower>=warpDriveMovementPower THEN IF newXAxis|->newYAxis: space THEN IF not(newXAxis = xAxis & newYAxis = yAxis) THEN IF not(newXAxis|->newYAxis: asteroids) THEN xAxis:=newXAxis || yAxis:=newYAxis || currentPower:=currentPower-warpDriveMovementPower || regionsVisited:=regionsVisited<-(newXAxis|->newYAxis) || report:=WarpSuccessful ELSE currentPower:=currentPower-asteroidCollisionPower || noOfAsteroidCollisions:=noOfAsteroidCollisions+1 || report:=WarpError_OccupiedByAsteroid END ELSE report:=WarpError_UnableToWarpToTheSameRegion END ELSE report:=WarpError_OutOfBounds END ELSE report:=WarpError_InsufficientPower END ELSE report:=GameOverRestartTheGame END);
  List_Substitution(Machine(Spaceship),MissionStatus)==(currentLocation:=xAxis|->yAxis || currentPowerReserve:=currentPower || totalAsteroidCollisions:=noOfAsteroidCollisions);
  List_Substitution(Machine(Spaceship),RegionsVisited)==(regions:=regionsVisited);
  List_Substitution(Machine(Spaceship),DockedAtStarbase)==(IF xAxis|->yAxis = starbase THEN dockedStatus:=SpaceshipDockedAtStarbase ELSE dockedStatus:=SpaceshipNotDockedAtStarbase END);
  List_Substitution(Machine(Spaceship),GameStatus)==(IF xAxis|->yAxis = starbase THEN gameStatus:=GameWon ELSE IF currentPower<normalMovementPower THEN gameStatus:=GameLost ELSE gameStatus:=GameNotOver END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Spaceship))==(normalMovementPower,warpDriveMovementPower,asteroidCollisionPower);
  Inherited_List_Constants(Machine(Spaceship))==(?);
  List_Constants(Machine(Spaceship))==(normalMovementPower,warpDriveMovementPower,asteroidCollisionPower)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Spaceship),MOVEMENT)==({Up,Down,Forward,Reverse,Warp});
  Context_List_Enumerated(Machine(Spaceship))==(?);
  Context_List_Defered(Machine(Spaceship))==(?);
  Context_List_Sets(Machine(Spaceship))==(?);
  List_Valuable_Sets(Machine(Spaceship))==(?);
  Inherited_List_Enumerated(Machine(Spaceship))==(?);
  Inherited_List_Defered(Machine(Spaceship))==(?);
  Inherited_List_Sets(Machine(Spaceship))==(?);
  List_Enumerated(Machine(Spaceship))==(MOVEMENT,MOVEMENT_REPORT,DOCKED_STATUS,GAME_STATUS);
  List_Defered(Machine(Spaceship))==(?);
  List_Sets(Machine(Spaceship))==(MOVEMENT,MOVEMENT_REPORT,DOCKED_STATUS,GAME_STATUS);
  Set_Definition(Machine(Spaceship),MOVEMENT_REPORT)==({MovementSuccessful,MovementError_OutOfBounds,MovementError_OccupiedByAsteriod,MovementError_InsufficientPower,WarpSuccessful,WarpError_OutOfBounds,WarpError_OccupiedByAsteroid,WarpError_InsufficientPower,WarpError_UnableToWarpToTheSameRegion,GameOverRestartTheGame});
  Set_Definition(Machine(Spaceship),DOCKED_STATUS)==({SpaceshipDockedAtStarbase,SpaceshipNotDockedAtStarbase});
  Set_Definition(Machine(Spaceship),GAME_STATUS)==({GameWon,GameLost,GameNotOver})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Spaceship))==(?);
  Expanded_List_HiddenConstants(Machine(Spaceship))==(?);
  List_HiddenConstants(Machine(Spaceship))==(?);
  External_List_HiddenConstants(Machine(Spaceship))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Spaceship))==(btrue);
  Context_List_Properties(Machine(Spaceship))==(spaceXAxis <: NAT1 & spaceXAxis = 1..12 & spaceYAxis <: NAT1 & spaceYAxis = 1..7 & space = spaceXAxis*spaceYAxis & asteroids <: space & asteroids = {7|->7,8|->3,10|->6,11|->2,12|->5,3|->2,3|->5,5|->4,6|->7,7|->1,7|->5} & emptyRegion <: space & emptyRegion/\asteroids = {} & emptyRegion\/asteroids = space & homebase: space & homebase: emptyRegion & homebase = 1|->1 & starbase: space & starbase: emptyRegion & starbase = 6|->4);
  Inherited_List_Properties(Machine(Spaceship))==(btrue);
  List_Properties(Machine(Spaceship))==(normalMovementPower = 5 & warpDriveMovementPower = 20 & asteroidCollisionPower = 10 & MOVEMENT: FIN(INTEGER) & not(MOVEMENT = {}) & MOVEMENT_REPORT: FIN(INTEGER) & not(MOVEMENT_REPORT = {}) & DOCKED_STATUS: FIN(INTEGER) & not(DOCKED_STATUS = {}) & GAME_STATUS: FIN(INTEGER) & not(GAME_STATUS = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Spaceship),Machine(Space))==(?);
  Seen_Context_List_Enumerated(Machine(Spaceship))==(?);
  Seen_Context_List_Invariant(Machine(Spaceship))==(btrue);
  Seen_Context_List_Assertions(Machine(Spaceship))==(btrue);
  Seen_Context_List_Properties(Machine(Spaceship))==(btrue);
  Seen_List_Constraints(Machine(Spaceship))==(btrue);
  Seen_List_Operations(Machine(Spaceship),Machine(Space))==(?);
  Seen_Expanded_List_Invariant(Machine(Spaceship),Machine(Space))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Spaceship),NewGame)==(?);
  List_ANY_Var(Machine(Spaceship),MoveUp)==(?);
  List_ANY_Var(Machine(Spaceship),MoveDown)==(?);
  List_ANY_Var(Machine(Spaceship),MoveForward)==(?);
  List_ANY_Var(Machine(Spaceship),MoveBackward)==(?);
  List_ANY_Var(Machine(Spaceship),EngageWarpDrive)==(?);
  List_ANY_Var(Machine(Spaceship),MissionStatus)==(?);
  List_ANY_Var(Machine(Spaceship),RegionsVisited)==(?);
  List_ANY_Var(Machine(Spaceship),DockedAtStarbase)==(?);
  List_ANY_Var(Machine(Spaceship),GameStatus)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Spaceship)) == (normalMovementPower,warpDriveMovementPower,asteroidCollisionPower,MOVEMENT,MOVEMENT_REPORT,DOCKED_STATUS,GAME_STATUS,Up,Down,Forward,Reverse,Warp,MovementSuccessful,MovementError_OutOfBounds,MovementError_OccupiedByAsteriod,MovementError_InsufficientPower,WarpSuccessful,WarpError_OutOfBounds,WarpError_OccupiedByAsteroid,WarpError_InsufficientPower,WarpError_UnableToWarpToTheSameRegion,GameOverRestartTheGame,SpaceshipDockedAtStarbase,SpaceshipNotDockedAtStarbase,GameWon,GameLost,GameNotOver | ? | regionsVisited,noOfAsteroidCollisions,currentPower,yAxis,xAxis | ? | NewGame,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus | ? | seen(Machine(Space)) | ? | Spaceship);
  List_Of_HiddenCst_Ids(Machine(Spaceship)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Spaceship)) == (normalMovementPower,warpDriveMovementPower,asteroidCollisionPower);
  List_Of_VisibleVar_Ids(Machine(Spaceship)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Spaceship)) == (?: ?);
  List_Of_Ids(Machine(Space)) == (spaceXAxis,spaceYAxis,space,asteroids,emptyRegion,homebase,starbase | ? | ? | ? | ? | ? | ? | ? | Space);
  List_Of_HiddenCst_Ids(Machine(Space)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Space)) == (spaceXAxis,spaceYAxis,space,asteroids,emptyRegion,homebase,starbase);
  List_Of_VisibleVar_Ids(Machine(Space)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Space)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Spaceship)) == (Type(MOVEMENT) == Cst(SetOf(etype(MOVEMENT,0,4)));Type(MOVEMENT_REPORT) == Cst(SetOf(etype(MOVEMENT_REPORT,0,9)));Type(DOCKED_STATUS) == Cst(SetOf(etype(DOCKED_STATUS,0,1)));Type(GAME_STATUS) == Cst(SetOf(etype(GAME_STATUS,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Spaceship)) == (Type(Up) == Cst(etype(MOVEMENT,0,4));Type(Down) == Cst(etype(MOVEMENT,0,4));Type(Forward) == Cst(etype(MOVEMENT,0,4));Type(Reverse) == Cst(etype(MOVEMENT,0,4));Type(Warp) == Cst(etype(MOVEMENT,0,4));Type(MovementSuccessful) == Cst(etype(MOVEMENT_REPORT,0,9));Type(MovementError_OutOfBounds) == Cst(etype(MOVEMENT_REPORT,0,9));Type(MovementError_OccupiedByAsteriod) == Cst(etype(MOVEMENT_REPORT,0,9));Type(MovementError_InsufficientPower) == Cst(etype(MOVEMENT_REPORT,0,9));Type(WarpSuccessful) == Cst(etype(MOVEMENT_REPORT,0,9));Type(WarpError_OutOfBounds) == Cst(etype(MOVEMENT_REPORT,0,9));Type(WarpError_OccupiedByAsteroid) == Cst(etype(MOVEMENT_REPORT,0,9));Type(WarpError_InsufficientPower) == Cst(etype(MOVEMENT_REPORT,0,9));Type(WarpError_UnableToWarpToTheSameRegion) == Cst(etype(MOVEMENT_REPORT,0,9));Type(GameOverRestartTheGame) == Cst(etype(MOVEMENT_REPORT,0,9));Type(SpaceshipDockedAtStarbase) == Cst(etype(DOCKED_STATUS,0,1));Type(SpaceshipNotDockedAtStarbase) == Cst(etype(DOCKED_STATUS,0,1));Type(GameWon) == Cst(etype(GAME_STATUS,0,2));Type(GameLost) == Cst(etype(GAME_STATUS,0,2));Type(GameNotOver) == Cst(etype(GAME_STATUS,0,2));Type(normalMovementPower) == Cst(btype(INTEGER,?,?));Type(warpDriveMovementPower) == Cst(btype(INTEGER,?,?));Type(asteroidCollisionPower) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Spaceship)) == (Type(regionsVisited) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(noOfAsteroidCollisions) == Mvl(btype(INTEGER,?,?));Type(currentPower) == Mvl(btype(INTEGER,?,?));Type(yAxis) == Mvl(btype(INTEGER,?,?));Type(xAxis) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Spaceship)) == (Type(GameStatus) == Cst(etype(GAME_STATUS,?,?),No_type);Type(DockedAtStarbase) == Cst(etype(DOCKED_STATUS,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(EngageWarpDrive) == Cst(etype(MOVEMENT_REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MoveBackward) == Cst(etype(MOVEMENT_REPORT,?,?),No_type);Type(MoveForward) == Cst(etype(MOVEMENT_REPORT,?,?),No_type);Type(MoveDown) == Cst(etype(MOVEMENT_REPORT,?,?),No_type);Type(MoveUp) == Cst(etype(MOVEMENT_REPORT,?,?),No_type);Type(NewGame) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(Spaceship)) == (Type(GameStatus) == Cst(etype(GAME_STATUS,?,?),No_type);Type(DockedAtStarbase) == Cst(etype(DOCKED_STATUS,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
