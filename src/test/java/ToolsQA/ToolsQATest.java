package ToolsQA;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import static org.junit.Assert.*;

public class ToolsQATest {

    @Test
    public void Test1() {
        String name = "Etash";
        assertEquals(name, "Etash");
    }
}
