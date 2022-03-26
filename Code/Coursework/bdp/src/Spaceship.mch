/* *************************************************************
 * 6SENG003C Reasoning About Programs
 * Machine:  Spaceship
 * Spec:     Coursework Specification
 * Author:   Shiromi Thevarajan
 * Created:  Monday, 01 November 2021
 ************************************************************ */

MACHINE Spaceship

        SEES
                Space

        SETS
                MOVEMENT = { Up , Down , Forward , Reverse , Warp } ;
                MOVEMENT_REPORT = { MovementSuccessful , MovementError_OutOfBounds , MovementError_OccupiedByAsteriod , MovementError_InsufficientPower , WarpSuccessful , WarpError_OutOfBounds , WarpError_OccupiedByAsteroid , WarpError_InsufficientPower , WarpError_UnableToWarpToTheSameRegion , GameOverRestartTheGame } ;
                DOCKED_STATUS = { SpaceshipDockedAtStarbase , SpaceshipNotDockedAtStarbase } ;
                GAME_STATUS = { GameWon , GameLost , GameNotOver }








































        CONCRETE_CONSTANTS
                normalMovementPower ,
                warpDriveMovementPower ,
                asteroidCollisionPower

        PROPERTIES
                normalMovementPower = 5 &
                warpDriveMovementPower = 20 &
                asteroidCollisionPower = 10

        ABSTRACT_VARIABLES
                xAxis ,
                yAxis ,
                currentPower ,
                noOfAsteroidCollisions ,
                regionsVisited

        INVARIANT
                xAxis : NAT1 &
                xAxis : spaceXAxis &
                yAxis : NAT1 &
                yAxis : spaceYAxis &
                xAxis |-> yAxis : space &
                xAxis |-> yAxis : emptyRegion &
                currentPower : INTEGER &
                noOfAsteroidCollisions : NAT &
                regionsVisited : seq ( space ) &
                regionsVisited : seq ( emptyRegion )

        INITIALISATION
                xAxis := 1 ||
                yAxis := 1 ||
                currentPower := 100 ||
                noOfAsteroidCollisions := 0 ||
                regionsVisited := [ ( 1 |-> 1 ) ]

        OPERATIONS
                /** Starts or re-stars the game. **/
                NewGame ( power ) =
        PRE
            power : NAT
                THEN
                        xAxis := 1 ||
                        yAxis := 1 ||
                        currentPower := power ||
                        noOfAsteroidCollisions := 0 ||
                        regionsVisited := [ ( 1 |-> 1 ) ]
                END ;

                /** Moves the spaceship one region up. **/
                report <-- MoveUp =
                PRE
                        report : MOVEMENT_REPORT
                THEN
                        IF
                            /* Checks if the game is over. */
                                not ( ( ( ( xAxis |-> yAxis ) = starbase ) or ( currentPower < normalMovementPower ) ) )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        ( currentPower >= normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                ( xAxis |-> succ ( yAxis ) : space )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( ( xAxis |-> succ ( yAxis ) : asteroids )       )
                                                THEN
                                                        yAxis := succ ( yAxis ) ||
                                                        currentPower := currentPower - normalMovementPower ||
                                                        regionsVisited := regionsVisited <- ( xAxis |-> succ ( yAxis ) ) ||
                                                        report := MovementSuccessful
                                                ELSE
                                                        currentPower := currentPower - asteroidCollisionPower ||
                                                        noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
                                                        report := MovementError_OccupiedByAsteriod
                                                END
                                        ELSE
                                                report := MovementError_OutOfBounds
                                        END
                                ELSE
                                        report := MovementError_InsufficientPower
                                END
                        ELSE
                                report := GameOverRestartTheGame
                        END
                END ;

                /** Moves the spaceship one region down. **/
                report <-- MoveDown =
                PRE
                        report : MOVEMENT_REPORT
                THEN
                        IF
                            /* Checks if the game is over. */
                                not ( ( ( ( xAxis |-> yAxis ) = starbase ) or ( currentPower < normalMovementPower ) ) )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        ( currentPower >= normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                ( xAxis |-> pred ( yAxis ) : space )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( ( xAxis |-> pred ( yAxis ) : asteroids )       )
                                                THEN
                                                        yAxis := pred ( yAxis ) ||
                                                        currentPower := currentPower - normalMovementPower ||
                                                        regionsVisited := regionsVisited <- ( xAxis |-> pred ( yAxis ) ) ||
                                                        report := MovementSuccessful
                                                ELSE
                                                        currentPower := currentPower - asteroidCollisionPower ||
                                                        noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
                                                        report := MovementError_OccupiedByAsteriod
                                                END
                                        ELSE
                                                report := MovementError_OutOfBounds
                                        END
                                ELSE
                                        report := MovementError_InsufficientPower
                                END
                        ELSE
                                report := GameOverRestartTheGame
                        END
                END ;

                /** Moves the spaceship one region to the right. **/
                report <-- MoveForward =
                PRE
                        report : MOVEMENT_REPORT
                THEN
                        IF
                            /* Checks if the game is over. */
                                not ( ( ( ( xAxis |-> yAxis ) = starbase ) or ( currentPower < normalMovementPower ) ) )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        ( currentPower >= normalMovementPower )
                                THEN
                                        IF

                                                ( succ ( xAxis ) |-> yAxis : space )
                                        THEN
                                                IF

                                                        not ( ( succ ( xAxis ) |-> yAxis : asteroids )       )
                                                THEN
                                                        xAxis := succ ( xAxis ) ||
                                                        currentPower := currentPower - normalMovementPower ||
                                                        regionsVisited := regionsVisited <- ( succ ( xAxis ) |-> yAxis ) ||
                                                        report := MovementSuccessful
                                                ELSE
                                                        currentPower := currentPower - asteroidCollisionPower ||
                                                        noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
                                                        report := MovementError_OccupiedByAsteriod
                                                END
                                        ELSE
                                                report := MovementError_OutOfBounds
                                        END
                                ELSE
                                        report := MovementError_InsufficientPower
                                END
                        ELSE
                                report := GameOverRestartTheGame
                        END
                END ;

                /** Moves the spaceship one region to the left. **/
                report <-- MoveBackward =
                PRE
                        report : MOVEMENT_REPORT
                THEN
                        IF
                            /* Checks if the game is over. */
                                not ( ( ( ( xAxis |-> yAxis ) = starbase ) or ( currentPower < normalMovementPower ) ) )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        ( currentPower >= normalMovementPower )
                                THEN
                                        IF

                                                ( pred ( xAxis ) |-> yAxis : space )
                                        THEN
                                                IF

                                                        not ( ( pred ( xAxis ) |-> yAxis : asteroids )       )
                                                THEN
                                                        xAxis := pred ( xAxis ) ||
                                                        currentPower := currentPower - normalMovementPower ||
                                                        regionsVisited := regionsVisited <- ( pred ( xAxis ) |-> yAxis ) ||
                                                        report := MovementSuccessful
                                                ELSE
                                                        currentPower := currentPower - asteroidCollisionPower ||
                                                        noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
                                                        report := MovementError_OccupiedByAsteriod
                                                END
                                        ELSE
                                                report := MovementError_OutOfBounds
                                        END
                                ELSE
                                        report := MovementError_InsufficientPower
                                END
                        ELSE
                                report := GameOverRestartTheGame
                        END
                END ;

                /** Performs warp drive movement to the given region. 
		NOTE: The user can directly warp to the star base from home base. **/
                report <-- EngageWarpDrive ( newXAxis , newYAxis ) =
                PRE
                        report : MOVEMENT_REPORT &
                        newXAxis : NAT1 &
                        newXAxis : spaceXAxis &
                        newYAxis : NAT1 &
                        newYAxis : spaceYAxis
                THEN
                        IF
                            /* Checks if the game is over. */
                                not ( ( ( ( xAxis |-> yAxis ) = starbase ) or ( currentPower < normalMovementPower ) ) )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        ( currentPower >= warpDriveMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                ( newXAxis |-> newYAxis : space )
                                        THEN
                                                IF
                                                        /* Checks if the given region is same as the current region. */
                                                        not ( ( newXAxis = xAxis ) & ( newYAxis = yAxis ) )
                                                THEN
                                                        IF
                                                                /* Checks if the region is occupied by the asteroid. */
                                                                not ( ( newXAxis |-> newYAxis : asteroids )       )
                                                        THEN
                                                                xAxis := newXAxis ||
                                                                yAxis := newYAxis ||
                                                                currentPower := currentPower - warpDriveMovementPower ||
                                                                regionsVisited := regionsVisited <- ( newXAxis |-> newYAxis ) ||
                                                                report := WarpSuccessful
                                                        ELSE
                                                                currentPower := currentPower - asteroidCollisionPower ||
                                                                noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
                                                                report := WarpError_OccupiedByAsteroid
                                                        END
                                                ELSE
                                                        report := WarpError_UnableToWarpToTheSameRegion
                                                END
                                        ELSE
                                                report := WarpError_OutOfBounds
                                        END
                                ELSE
                                        report := WarpError_InsufficientPower
                                END
                        ELSE
                                report := GameOverRestartTheGame
                        END
                END ;

        /** Performs warp drive movement to the given region. 
		NOTE: EngageWarpDrive (newposition) OPERATION with single parameter 'newposition'. **/
//        report <-- EngageWarpDrive ( newposition ) =
//		PRE
//			report : MOVEMENT_REPORT &
//			newposition : space &
//			newposition : emptyRegion
//		THEN
//			IF
//			    /* Checks if the game is over */
//				not ( isGameOver )
//			THEN
//				IF
//					/* Checks if there is enough power for the selected movement */
//					hasEnoughPower ( currentPower, warpDriveMovementPower )
//				THEN
//					IF
//						/* Checks if the spaceship is within the space */
//						isWithinBounds ( newXPosition ( newposition ) , newYPosition ( newposition ) )
//					THEN
//						IF
//							/* Checks if the given region is same as the current region */
//							not ( ( newXPosition ( newposition ) = xAxis ) & ( newYPosition ( newposition ) = yAxis ) )
//						THEN
//							IF
//								/* Checks if the region is occupied by the asteroid */
//								not ( isOccupiedByAsteroid ( newXPosition ( newposition ), newYPosition ( newposition ) ) )
//							THEN
//								xAxis := newXPosition ( newposition ) ||
//								yAxis := newYPosition ( newposition ) ||
//								currentPower := currentPower - warpDriveMovementPower ||
//								regionsVisited := regionsVisited <- ( newXPosition ( newposition ) |-> newYPosition ( newposition ) ) ||
//								report := WarpSuccessful
//							ELSE
//								currentPower := currentPower - asteroidCollisionPower ||
//								noOfAsteroidCollisions := noOfAsteroidCollisions + 1 ||
//								report := WarpError_OccupiedByAsteroid
//							END
//						ELSE
//							report := WarpError_UnableToWarpToTheSameRegion
//						END
//					ELSE
//						report := WarpError_OutOfBounds
//					END	
//				ELSE
//					report := WarpError_InsufficientPower
//				END
//			ELSE
//				report := GameOverRestartTheGame
//			END
//		END ;

                /** Reports the current status of the spaceship. **/
                currentLocation , currentPowerReserve , totalAsteroidCollisions <-- MissionStatus =
                BEGIN
                        currentLocation := xAxis |-> yAxis ||
                        currentPowerReserve := currentPower ||
                        totalAsteroidCollisions := noOfAsteroidCollisions
                END ;

                /** Reports the regions visited by the spaceship. **/
                regions <-- RegionsVisited =
                BEGIN
                        regions := regionsVisited
                END ;

                /** Reports whether the spaceship is docked at the star base. **/
                dockedStatus <-- DockedAtStarbase =
                PRE
                        dockedStatus : DOCKED_STATUS
                THEN
                        IF
                                ( ( ( xAxis |-> yAxis ) = starbase ) )
                        THEN
                                dockedStatus := SpaceshipDockedAtStarbase
                        ELSE
                                dockedStatus := SpaceshipNotDockedAtStarbase
                        END
                END ;

                /** Reports the status of the game. **/
                gameStatus <-- GameStatus =
                PRE
                        gameStatus : GAME_STATUS
                THEN
                        IF
                                ( ( ( xAxis |-> yAxis ) = starbase ) )
                        THEN
                                gameStatus := GameWon
                        ELSE
                                IF
                                        ( currentPower < normalMovementPower )
                                THEN
                                        gameStatus := GameLost
                                ELSE
                                        gameStatus := GameNotOver
                                END
                        END
                END

END /* Spaceship */
