import org.junit.Assert;
import org.junit.Test;

import java.io.File;

public class TestYARS {

    private static File [] ok = new File("../yars/examples").listFiles(pathname -> pathname.isFile());

    private static File gfiles =  new File("../yars/YARS.g4");

    @Test
    public void test(){
        Assert.assertTrue(GrammarTester.run(ok, "yars", gfiles));
    }


}
