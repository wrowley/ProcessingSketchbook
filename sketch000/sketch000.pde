/* Binary counting? */

float b = 0.8;
int num_bits = 8;
boolean[] bits = new boolean[num_bits];
color red, blue, green, yellow, cb = 50;

float scale_rect = 0.6;
int width_rect ;
int height_rect;
float woffset_rect;

int   count;
float count_freq_hz = 2.0; // Hz
float count_period_ms = 1000.0/count_freq_hz; //ms

void setup() {
    size(800, 800);
    noStroke();

    red    = color(255 * b, 179 * b, 186 * b);
    yellow = color(255 * b, 255 * b, 186 * b);
    blue   = color(186 * b, 225 * b, 255 * b);
    green  = color(186 * b, 255 * b, 201 * b);

    width_rect  = round(width  * scale_rect / num_bits); // magic width
    height_rect = round(height * scale_rect); // magic width

    woffset_rect = (width - num_bits * width_rect)/(float)num_bits/2;
}

void populate_bits(int count)
{
    for (int i = 0; i < num_bits; i++)
    {
        bits[num_bits - i - 1] = (((count >> i) & 1) == 1) ? true : false;
    }
}

void draw() {
    int num_millis = millis();
    count = round(num_millis / count_period_ms) % (1 << num_bits);
    populate_bits(count);

    background(cb);

    color[] colors = { red, yellow, green, blue};
    for(int j = 0; j < num_bits; j++) {
        if (bits[j])
        {
            fill(colors[j % colors.length]);
        }
        else
        {
            fill(cb);
        }
        rect(j * width/num_bits + woffset_rect, height/2 - height_rect/2, width_rect, height_rect);
    }
}
