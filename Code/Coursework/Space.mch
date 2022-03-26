/* *************************************************************
 * 6SENG003C Reasoning About Programs
 * Machine:  Space
 * Spec:     Coursework Specification
 * Author:   Shiromi Thevarajan
 * Created:  Monday, 01 November 2021
 ************************************************************ */
 
MACHINE Space

    CONSTANTS
        spaceXAxis,
		spaceYAxis,
		space,
		asteroids,
		emptyRegion,
		homebase,
		starbase

    PROPERTIES
		// Space
		spaceXAxis <: NAT1 &
		spaceXAxis = 1..12 &
		spaceYAxis <: NAT1 &
		spaceYAxis = 1..7 &
		space = spaceXAxis * spaceYAxis &
		
		// Asteroids
		asteroids <: space &
		asteroids = { ( 7 |-> 7 ), ( 8 |-> 3 ), ( 10 |-> 6 ), ( 11 |-> 2 ), ( 12 |-> 5 ), ( 3 |-> 2 ), ( 3 |-> 5 ), ( 5 |-> 4 ), ( 6 |-> 7 ), ( 7 |-> 1 ), ( 7 |-> 5 ) } &

        // Empty Region
		emptyRegion <: space &
		emptyRegion /\ asteroids = {} &
		emptyRegion \/ asteroids = space &
		
		// Home Base
		homebase : space &
		homebase : emptyRegion &
		homebase = 1 |-> 1 &
		
		// Star Base
		starbase : space &
		starbase : emptyRegion &
		starbase =  6 |-> 4
        
END /* Space */
