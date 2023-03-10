float rS = 160;
float rM = 123;
float rH = 86;
float rC = 154;
float rC_ = 180; // clock size


void setup()
{
  size(800, 800);
}

void draw() 
{
    background(255, 255, 255);
    
    textAlign(CENTER);
    textSize(33);
    
    stroke(0);
    strokeWeight(8);
    fill(235, 252, 255);
    ellipse(width/2, height/2, rC_ * 2, rC_ * 2);
    var s = map(second(), 0, 60, 0, TWO_PI) - PI/2 ;
    var m = map(norm(second(), 0, 60) + minute(), 0, 60, 0, TWO_PI) - PI/2;
    var h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, 2 * TWO_PI) - PI/2;
    
    // seconds hand
    stroke(255, 0, 0);
    strokeWeight(1);
    line(width/2, height/2, width/2 + rS * cos(s), height/2 + rS * sin(s));
    // minute hand
    stroke(0, 0, 0);
    strokeWeight(2);
    line(width/2, height/2, width/2 + rM * cos(m), height/2 + rM * sin(m));
    // hour hand
    stroke(0);
    strokeWeight(4);
    line(width/2, height/2, width/2 + rH * cos(h), height/2 + rH * sin(h));

    // draw Clock
    stroke(0, 0, 0);
    strokeWeight(5);
    int i = 12;
    for(float theta = 0; theta < TWO_PI; theta += 0.523599, i--)
    {
        float x = width/2 + rC * -0.95 * sin(theta);
        float y = height/2 + rC * -0.95 * cos(theta);
        
        //point(x, y);
        fill(0, 0, 0);
        if(i == 12 || i == 6)
        {   
            textAlign(CENTER);
            text(i, (width/2 - (sin(theta))) , (height/2 + cos(theta) * -153) + 10);
        }
        else if(i == 3 || i == 9)
        {
            textAlign(CENTER);
            text(i, (width/2 - sin(theta) * 160) , height/2 + 9);
        }
        else
        {
            strokeWeight(2);
            stroke(0, 0, 0);
            line( (width/2 - (sin(theta) * 170)) , (height/2 + cos(theta) * -170), x, y);
        }

    }

    stroke(0, 0, 0);
    strokeWeight(5);
    ellipse(width/2, height/2, 6, 6);
}
