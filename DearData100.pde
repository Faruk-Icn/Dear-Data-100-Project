int PetalCount = 5;
float centerSize = 50;
void setup() 
{
    size(400, 400);
    background(255);
}

void draw() 
{

    // draw the petals of the flower
    fill(255, 0, 0);
    translate(width/2, height/2);
    for (int i = 0; i < PetalCount; i++)
    {

        float circumference = TWO_PI * centerSize * 0.5;
        float petalSizex = centerSize * 0.8;
        float petalSizey = circumference / PetalCount;
        float angle = TWO_PI / PetalCount * i;

        

        pushMatrix();
        rotate(angle);
        ellipse(centerSize * 0.5, 0, petalSizex, petalSizey);
        popMatrix();
    }
    // draw the center of the flower
    fill(255, 204, 0);
    ellipse(0, 0, centerSize, centerSize);

}
