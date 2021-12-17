/**
 This class represents a database.  There are many
 competing threads wishing to read and write.  It is
 acceptable to have multiple processes reading at the
 same time, but if one thread is writing then no other
 process may either read or write.
 */
public class Database
{
    private int readers; // number of active readers

    /**
     Initializes this database.
     */
    public Database()
    {
        this.readers = 0;
    }

    /**
     Read from this database.

     @param id id of the reader.
     */
    public void read(int id)
    {
        synchronized(this)
        {
            this.readers++;
            System.out.println("Reader " + id + " starts reading.");
        }

        final int DELAY = 5000;
        try
        {
            Thread.sleep((int) (Math.random() * DELAY));
        }
        catch (InterruptedException e) {}

        synchronized(this)
        {
            System.out.println("Reader " + id + " stops reading.");
            this.readers--;
            if (this.readers == 0)
            {
                this.notifyAll();
            }
        }
    }

    /**
     Writes to this database.

     @param id id of the writer.
     */
    public synchronized void write(int id)
    {
        while (this.readers != 0)
        {
            try
            {
                this.wait();
            }
            catch (InterruptedException e) {}
        }
        System.out.println("Writer " + id + " starts writing.");

        final int DELAY = 5000;
        try
        {
            Thread.sleep((int) (Math.random() * DELAY));
        }
        catch (InterruptedException e) {}

        System.out.println("Writer " + id + " stops writing.");
        this.notifyAll();
    }
}