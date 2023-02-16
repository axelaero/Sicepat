package test.soal3;

import com.intuit.karate.junit5.Karate;

class soal3 {
    
    @Karate.Test
    Karate testApi() {
        return Karate.run("soal3").relativeTo(getClass());
    }    

}
