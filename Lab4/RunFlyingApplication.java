import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the FlyingApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunFlyingApplication {
    public static void main(String[] args) {

    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver");
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection("jdbc:postgresql://cmps180-db.lt.ucsc.edu/aahchan",
                                                     "aahchan",
                                                     "compound19default");

            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the FlyingApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
             FlyingApplication app = new FlyingApplication(connection);


            /* ------- Testing for getAirlinesWithManyFlights ------- */
             List<String> result = app.getAirlinesWithManyFlights(3);
             System.out.println("Airline Names with at least 3 Different Flights: ");
             for(String temp : result)
                System.out.println(temp);

                /* Airline Names with at least 3 Different Flights:
                 * American Airlines
                 * Delta Airlines
                 * Frontier Airlines
                 * JetBlue Airways
                 * Southwest Airlines
                 * Spirit Airlines
                 * United Airlines
                 * Virgin America
                */

           /* ------- Test for raiseAirlineTicketCosts ------- */
           try(Statement stmt = connection.createStatement();
              ResultSet rs = stmt.executeQuery(
                "SELECT AirlineID, Cost FROM Tickets WHERE AirlineID = 'UAL'");){
//                  System.out.println("Outputting before raiseAirlineTicketCosts: ");
                  while(rs.next()){
//                    System.out.println(rs.getObject(1) + " " + rs.getObject(2));
                  }
              }
            catch(SQLException e){
              System.out.println("before raiseAirlineTicketCosts statement error");
            }
            app.raiseAirlineTicketCosts("UAL", 25);

          try(Statement stmt = connection.createStatement();
              ResultSet rs = stmt.executeQuery(
                "SELECT AirlineID, Cost FROM Tickets WHERE AirlineID = 'UAL'");){
//                System.out.println("Outputting after raiseAirlineTicketCosts: ");
                while(rs.next())
                {
//                   System.out.println(rs.getObject(1) + " " + rs.getObject(2));
                }
             } catch(SQLException e){
               System.out.println("after raiseAirlineTicketCosts statement error");
             }

            /*    Updated 5 elements    */



            /* ------- Test for deleteSomeUnpaidTickets ------- */
            System.out.println("DeleteCount(1):");
            System.out.println(app.deleteSomeUnpaidTickets(1));
            System.out.println("DeleteCount(2):");
            System.out.println(app.deleteSomeUnpaidTickets(2));



            /*******************
            * Your code ends here */

    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
				  	connection.close();
				  }
          catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
