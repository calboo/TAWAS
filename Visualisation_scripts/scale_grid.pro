pro scale_grid

;; DESCRIPTION

; IDL script used to produce Figure 8 in the paper,
; Enhanced phase mixing of torsional Alfven waves in stratified and
; divergent solar coronal structures – Paper I. Linear solutions
; C.Boocock and D.Tsiklauri

; A colourful contour of the normalised wave energy flux is plotted
; against magnetic and density scale heights. The normalised wave
; energy flux is calculated for each pair of scale heights using
; TAWAS and taking the normalised wave energy flux over the highest
; magnetic surface in the domain. Note that colour scale used for the
; contour is logarithmic.

; The x and y axis are the magnetic and density scale heights
; respectively and vary from 20 to 100 Mm. Data points are shown as
; black diamond shaped markers and thick contour lines are used to
; indicate where the relative wave energy flux over the highest
; magnetic surface has values of 0.9 and 0.99. 

;; USAGE

; This script must be run in IDL, to run this script successfully
; the outputs from tawas.pro for each set of scale heights must have
; been produced and saved. 

; The user must make sure the filepaths given in the script below
; correlate to the locations of the saved output data.

; Note that in the parameter study the viscosity and wave period
; were fixed at viscosity = 5x10^7 m2s−1 and T = 60s respectively.
; Note also that for each set of scale height TAWAS was run with
; the same domain size, r_max = 40 Mm, z_max = 100 Mm.

;; SCRIPT

; Set up array to store the normalised wave energy flux over
; the highest magnetic surface for each pair of scale heights.

end_total = dblarr(9,9)

; Read in the normalised wave energy flux over the highest
; magnetic surface for each pair of scale heights.

restore, 'scale_height_study/Hb20/hp100/en_lvl_norm_0.sav'
end_total[0,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp90/en_lvl_norm_0.sav'
end_total[0,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp80/en_lvl_norm_0.sav'
end_total[0,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp70/en_lvl_norm_0.sav'
end_total[0,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp60/en_lvl_norm_0.sav'
end_total[0,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp50/en_lvl_norm_0.sav'
end_total[0,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp40/en_lvl_norm_0.sav'
end_total[0,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp30/en_lvl_norm_0.sav'
end_total[0,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb20/hp20/en_lvl_norm_0.sav'
end_total[0,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb30/hp100/en_lvl_norm_0.sav'
end_total[1,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp90/en_lvl_norm_0.sav'
end_total[1,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp80/en_lvl_norm_0.sav'
end_total[1,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp70/en_lvl_norm_0.sav'
end_total[1,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp60/en_lvl_norm_0.sav'
end_total[1,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp50/en_lvl_norm_0.sav'
end_total[1,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp40/en_lvl_norm_0.sav'
end_total[1,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp30/en_lvl_norm_0.sav'
end_total[1,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb30/hp20/en_lvl_norm_0.sav'
end_total[1,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb40/hp100/en_lvl_norm_0.sav'
end_total[2,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp90/en_lvl_norm_0.sav'
end_total[2,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp80/en_lvl_norm_0.sav'
end_total[2,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp70/en_lvl_norm_0.sav'
end_total[2,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp60/en_lvl_norm_0.sav'
end_total[2,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp50/en_lvl_norm_0.sav'
end_total[2,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp40/en_lvl_norm_0.sav'
end_total[2,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp30/en_lvl_norm_0.sav'
end_total[2,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb40/hp20/en_lvl_norm_0.sav'
end_total[2,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb50/hp100/en_lvl_norm_0.sav'
end_total[3,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp90/en_lvl_norm_0.sav'
end_total[3,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp80/en_lvl_norm_0.sav'
end_total[3,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp70/en_lvl_norm_0.sav'
end_total[3,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp60/en_lvl_norm_0.sav'
end_total[3,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp50/en_lvl_norm_0.sav'
end_total[3,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp40/en_lvl_norm_0.sav'
end_total[3,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp30/en_lvl_norm_0.sav'
end_total[3,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb50/hp20/en_lvl_norm_0.sav'
end_total[3,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb60/hp100/en_lvl_norm_0.sav'
end_total[4,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp90/en_lvl_norm_0.sav'
end_total[4,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp80/en_lvl_norm_0.sav'
end_total[4,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp70/en_lvl_norm_0.sav'
end_total[4,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp60/en_lvl_norm_0.sav'
end_total[4,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp50/en_lvl_norm_0.sav'
end_total[4,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp40/en_lvl_norm_0.sav'
end_total[4,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp30/en_lvl_norm_0.sav'
end_total[4,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb60/hp20/en_lvl_norm_0.sav'
end_total[4,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb70/hp100/en_lvl_norm_0.sav'
end_total[5,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp90/en_lvl_norm_0.sav'
end_total[5,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp80/en_lvl_norm_0.sav'
end_total[5,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp70/en_lvl_norm_0.sav'
end_total[5,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp60/en_lvl_norm_0.sav'
end_total[5,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp50/en_lvl_norm_0.sav'
end_total[5,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp40/en_lvl_norm_0.sav'
end_total[5,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp30/en_lvl_norm_0.sav'
end_total[5,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb70/hp20/en_lvl_norm_0.sav'
end_total[5,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb80/hp100/en_lvl_norm_0.sav'
end_total[6,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp90/en_lvl_norm_0.sav'
end_total[6,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp80/en_lvl_norm_0.sav'
end_total[6,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp70/en_lvl_norm_0.sav'
end_total[6,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp60/en_lvl_norm_0.sav'
end_total[6,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp50/en_lvl_norm_0.sav'
end_total[6,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp40/en_lvl_norm_0.sav'
end_total[6,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp30/en_lvl_norm_0.sav'
end_total[6,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb80/hp20/en_lvl_norm_0.sav'
end_total[6,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb90/hp100/en_lvl_norm_0.sav'
end_total[7,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp90/en_lvl_norm_0.sav'
end_total[7,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp80/en_lvl_norm_0.sav'
end_total[7,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp70/en_lvl_norm_0.sav'
end_total[7,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp60/en_lvl_norm_0.sav'
end_total[7,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp50/en_lvl_norm_0.sav'
end_total[7,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp40/en_lvl_norm_0.sav'
end_total[7,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp30/en_lvl_norm_0.sav'
end_total[7,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb90/hp20/en_lvl_norm_0.sav'
end_total[7,0] = en_lvl_norm[-1]

restore, 'scale_height_study/Hb100/hp100/en_lvl_norm_0.sav'
end_total[8,8] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp90/en_lvl_norm_0.sav'
end_total[8,7] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp80/en_lvl_norm_0.sav'
end_total[8,6] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp70/en_lvl_norm_0.sav'
end_total[8,5] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp60/en_lvl_norm_0.sav'
end_total[8,4] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp50/en_lvl_norm_0.sav'
end_total[8,3] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp40/en_lvl_norm_0.sav'
end_total[8,2] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp30/en_lvl_norm_0.sav'
end_total[8,1] = en_lvl_norm[-1]
restore, 'scale_height_study/Hb100/hp20/en_lvl_norm_0.sav'
end_total[8,0] = en_lvl_norm[-1]

; Make sure that none of the values in the array are too
; close to one to avoid problems with taking logarithms.

for i=0,8 do begin
   for j=0,8 do begin
      if (end_total[i,j] GT 0.999) then end_total[i,j]=0.999
   endfor
endfor

; Print the table end_total showing the wave energy flux
print, 'Total Table'
print, end_total

; Print 1-end_total showing the lost wave energy flux
print, ''
print, 1.0-end_total

; Print alog(1-end_total) showing the logarithm
; of the lost wave energy flux
print, ''
print, alog(1.0-end_total)

; Set up coordinates for data point markers

X = [20,20,20,20,20,20,20,20,20,$
     30,30,30,30,30,30,30,30,30,$
     40,40,40,40,40,40,40,40,40,$
     50,50,50,50,50,50,50,50,50,$
     60,60,60,60,60,60,60,60,60,$
     70,70,70,70,70,70,70,70,70,$
     80,80,80,80,80,80,80,80,80,$
     90,90,90,90,90,90,90,90,90,$
     100,100,100,100,100,100,100,100,100]
Y = [20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100,$
     20,30,40,50,60,70,80,90,100]

; Set up coordinates for contour plot

cx = [20,30,40,50,60,70,80,90,100]
cy = [20,30,40,50,60,70,80,90,100]

; Set up labels and levels for thick contour lines

labelnames=[0.99,0.9]
clevels = [alog(1-labelnames[0]),alog(1-labelnames[1])]

; Set up colour table for coloured contour

loadct, 13
TVLCT, 255, 255, 255, 254 ; White color
TVLCT, 0, 0, 0, 253       ; Black color
!P.Color = 253
!P.Background = 254

; Set up window for plot

window, 1, YSIZE=600, XSIZE=800

; Create coloured contour

contour,alog(1.0-end_total),cx,cy, /fill, nlevels=100,XSTYLE=1,YSTYLE=1, $
        POSITION=[0.15, 0.2, 0.95, 0.95], $
        XTITLE= 'H / Mm', YTITLE = 'H!D!7q!X!N / Mm', CHARTHICK= 2

; Set up colour table for thick contour lines

loadct, 0
TVLCT, 255, 255, 255, 254 ; White color
TVLCT, 0, 0, 0, 253       ; Black color
!P.Color = 253
!P.Background = 254

; Overplot thick contour lines and add labels

contour, alog(1.0-end_total),cx,cy,levels=clevels,$
         C_THICK=2,/OVERPLOT

XYOUTS, 155, 450, '0.9', CHARSIZE=2, CHARTHICK=2, /DEVICE
XYOUTS, 420, 360, '0.99', CHARSIZE=2, CHARTHICK=2, /DEVICE

; Overplot data point markers

symsize = 1.5
symX = [-symsize, 0, symsize, 0, -symsize]
symY = [0, symsize, 0, -symsize, 0]
USERSYM, symX, symY, /FILL
oplot, X,Y, psym=8

; Add a custom colourbar using plot_cbar

loadct, 13
plot_cbar, BOTTOM    = 0,        $
             NCOLORS   = 256,      $
             POSITION  = [0.2, 0.06, 0.90, 0.08], $
             MAX       = max(alog(1.0-end_total)),     $
             MIN       = min(alog(1.0-end_total)),     $
             CHARSIZE  = 1.5,      $
             COLOR     = 0,        $
             DIVISIONS = 5       

; Save image to a png file

WRITE_PNG, 'Images/scale_grid.png', TVRD(/TRUE)

end


; Program for adding a colour bar (used within main script)

PRO plot_cbar, BOTTOM    = bottom,    $
               NCOLORS   = ncolors,   $
               POSITION  = position,  $
               MAX       = max,       $
               MIN       = min,       $
               CHARSIZE  = charsize,  $
               COLOR     = color,     $
               DIVISIONS = divisions

  xstart = position(0) * !D.X_VSIZE
  ystart = position(1) * !D.Y_VSIZE
  xsize = (position(2) - position(0)) * !D.X_VSIZE
  ysize = (position(3) - position(1)) * !D.Y_VSIZE

  bar = BINDGEN(256) # REPLICATE(1B, 10)
  bar = 256 - BYTSCL(bar, TOP = ncolors - 1) + bottom
  bar = CONGRID(bar, CEIL(xsize), CEIL(ysize), /INTERP)

  IF (!D.NAME EQ 'PS') THEN BEGIN
      TV, bar, xstart, ystart, XSIZE = xsize, YSIZE = ysize
  ENDIF ELSE BEGIN
      TV, CONGRID(bar, xsize, ysize), xstart, ystart
  ENDELSE

  PLOT, [min, max], [min, max], /NODATA, /NOERASE, $
         XTICKNAME= ['0.369','0.817','0.950','0.986','0.996','0.999'], $
         XSTYLE = 1, XTICKS = divisions, $
         YSTYLE = 1, YTICKS = 1,         YTICKFORMAT = '(A1)', $
         POSITION = position, COLOR = color, CHARSIZE = charsize, $
         XRANGE = [min, max], TITLE = title, CHARTHICK = 2 

end
