import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Test;

public class SampleTest {

    @Test
    public void test() {
        Sample sample = new Sample();
        assertThat(sample.getMessage(), is("Sample!"));
    }
}
