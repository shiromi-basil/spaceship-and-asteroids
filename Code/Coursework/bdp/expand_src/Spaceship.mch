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

        DEFINITIONS
                isWithinBounds ( xx , yy ) == ( xx |-> yy : space ) ;
                isOccupiedByAsteroid ( xx , yy ) == ( xx |-> yy : asteroids ) ;
                hasEnoughPower ( currentPowerValue , requiredPowerValue ) == ( currentPowerValue >= requiredPowerValue ) ;
                isDocked == ( ( xAxis |-> yAxis ) = starbase ) ;
                isGameOver == ( isDocked or ( currentPower < normalMovementPower ) ) ;


        newXPosition ( position ) == prj1 ( spaceXAxis , spaceYAxis ) ( position ) ;
                newYPosition ( position ) == prj2 ( spaceXAxis , spaceYAxis ) ( position ) ;


        ANIMATION_FUNCTION == ( { row , col , i | row : spaceYAxis & col : spaceXAxis &
                ( IF ( col = prj1 ( spaceXAxis , spaceYAxis ) ( starbase ) & row = prj2 ( spaceXAxis , spaceYAxis ) ( starbase ) )
                    THEN
                        // Star Base
                        i = 0
                    ELSE
                        IF ( col |-> ( 8 - row ) : asteroids )
                        THEN
                            // Asteroid
                            i = 1
                        ELSE
                            IF ( col = xAxis & row = ( 8 - yAxis ) )
                            THEN
                                // Spaceship
                                i = 2
                            ELSE
                                // Empty Region
                                i = 3
                            END
                        END
                    END ) } ) ;

        ANIMATION_IMG0 == "images/starbase.gif" ;
        ANIMATION_IMG1 == "images/asteroid.gif" ;
        ANIMATION_IMG2 == "images/spaceship.gif" ;
        ANIMATION_IMG3 == "images/empty_region.gif" ;

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
                                not ( isGameOver )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        hasEnoughPower ( currentPower , normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                isWithinBounds ( xAxis , succ ( yAxis ) )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( isOccupiedByAsteroid ( xAxis , succ ( yAxis ) ) )
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
                                not ( isGameOver )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        hasEnoughPower ( currentPower , normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                isWithinBounds ( xAxis , pred ( yAxis ) )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( isOccupiedByAsteroid ( xAxis , pred ( yAxis ) ) )
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
                                not ( isGameOver )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        hasEnoughPower ( currentPower , normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                isWithinBounds ( succ ( xAxis ) , yAxis )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( isOccupiedByAsteroid ( succ ( xAxis ) , yAxis ) )
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
                                not ( isGameOver )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        hasEnoughPower ( currentPower , normalMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                isWithinBounds ( pred ( xAxis ) , yAxis )
                                        THEN
                                                IF
                                                        /* Checks if the region is occupied by the asteroid. */
                                                        not ( isOccupiedByAsteroid ( pred ( xAxis ) , yAxis ) )
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
                                not ( isGameOver )
                        THEN
                                IF
                                        /* Checks if there is enough power for the selected movement. */
                                        hasEnoughPower ( currentPower , warpDriveMovementPower )
                                THEN
                                        IF
                                                /* Checks if the spaceship is within the space. */
                                                isWithinBounds ( newXAxis , newYAxis )
                                        THEN
                                                IF
                                                        /* Checks if the given region is same as the current region. */
                                                        not ( ( newXAxis = xAxis ) & ( newYAxis = yAxis ) )
                                                THEN
                                                        IF
                                                                /* Checks if the region is occupied by the asteroid. */
                                                                not ( isOccupiedByAsteroid ( newXAxis , newYAxis ) )
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
                                ( isDocked )
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
                                ( isDocked )
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
