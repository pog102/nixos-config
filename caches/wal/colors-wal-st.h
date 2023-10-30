const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#00021C", /* black   */
  [1] = "#0E2399", /* red     */
  [2] = "#142BAC", /* green   */
  [3] = "#2339B6", /* yellow  */
  [4] = "#1D36C1", /* blue    */
  [5] = "#233CC6", /* magenta */
  [6] = "#3049D3", /* cyan    */
  [7] = "#96a3e8", /* white   */

  /* 8 bright colors */
  [8]  = "#6972a2",  /* black   */
  [9]  = "#0E2399",  /* red     */
  [10] = "#142BAC", /* green   */
  [11] = "#2339B6", /* yellow  */
  [12] = "#1D36C1", /* blue    */
  [13] = "#233CC6", /* magenta */
  [14] = "#3049D3", /* cyan    */
  [15] = "#96a3e8", /* white   */

  /* special colors */
  [256] = "#00021C", /* background */
  [257] = "#96a3e8", /* foreground */
  [258] = "#96a3e8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
