import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class FrontendBackendTest {
    WebDriver driver;

    @BeforeClass
    public void setUp() {
        driver = new ChromeDriver();
    }

    @Test
    public void testBackendGreetingMessage() {
        
    	//************Keep it configurable*************
        driver.get("http://localhost:8080");
        
        
        WebElement h1Element = driver.findElement(By.tagName("h1"));

        String h1Text = h1Element.getText();
        
        String expectedMessage = "Hello from the Backend!";  // Replace with expected message from backend
        Assert.assertEquals(h1Text, expectedMessage, "The message from the backend did not match.");
    }

    @AfterClass
    public void tearDown() {
        driver.quit();
    }
}
