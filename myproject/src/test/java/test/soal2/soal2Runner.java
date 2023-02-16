package test.soal2;

import com.intuit.karate.junit5.Karate;

class soal2Runner {
    
    @Karate.Test
    Karate testUi() {
        return Karate.run("soal2").relativeTo(getClass());
    }    

}
