pro visc_period_grid

;; DESCRIPTION

; IDL script used to produce Figure 9 in the paper,
; Enhanced phase mixing of torsional Alfven waves in stratified and
; divergent solar coronal structures – Paper I. Linear solutions
; C.Boocock and D.Tsiklauri

; A colourful contour of the normalised wave energy flux is plotted
; against viscosity and wave period. The normalised wave energy flux
; is calculated for each data point using TAWAS and taking the
; normalised wave energy flux over the highest magnetic surface in the
; domain. Note that colour scale used for the contour is logarithmic.

; The x and y axis are the wave period and viscosity respectively
; and vary from 10 to 120 s and 1x10^4 and 5x10^7 m2s-1 respectively.
; Data points are shown as black diamond shaped markers and thick
; contour lines are used to indicate where the relative wave energy
; flux over the highest magnetic surface has values of 0.1, 0.5 and 0.9. 

;; USAGE

; This script must be run in IDL, to run this script successfully
; the outputs from tawas.pro for each set of wave periods and
; viscosities must have been produced and saved. 

; The user must make sure the filepaths given in the script below
; correlate to the locations of the saved output data.

; Note that in the parameter study the magnetic and density scale
; heights were fixed at Hb = 20 Mm and Hrho = 100 Mm respectively.
; Note also that for each data point TAWAS was run with
; the same domain size, r_max = 40 Mm, z_max = 100 Mm.

;; SCRIPT

; Set up array to store the normalised wave energy flux over
; the highest magnetic surface for each data point.

end_total = dblarr(8,8)

; Read in the normalised wave energy flux over the highest
; magnetic surface for each data point.

print, 'total'

restore, 'visc_period_study/H20_nonstrat/t15/visc_5e7/en_lvl_norm_0.sav'
end_total[0,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_1e7/en_lvl_norm_0.sav'
end_total[0,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_5e6/en_lvl_norm_0.sav'
end_total[0,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_1e6/en_lvl_norm_0.sav'
end_total[0,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_5e5/en_lvl_norm_0.sav'
end_total[0,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_1e5/en_lvl_norm_0.sav'
end_total[0,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_5e4/en_lvl_norm_0.sav'
end_total[0,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t15/visc_1e4/en_lvl_norm_0.sav'
end_total[0,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t30/visc_5e7/en_lvl_norm_0.sav'
end_total[1,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_1e7/en_lvl_norm_0.sav'
end_total[1,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_5e6/en_lvl_norm_0.sav'
end_total[1,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_1e6/en_lvl_norm_0.sav'
end_total[1,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_5e5/en_lvl_norm_0.sav'
end_total[1,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_1e5/en_lvl_norm_0.sav'
end_total[1,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_5e4/en_lvl_norm_0.sav'
end_total[1,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t30/visc_1e4/en_lvl_norm_0.sav'
end_total[1,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t45/visc_5e7/en_lvl_norm_0.sav'
end_total[2,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_1e7/en_lvl_norm_0.sav'
end_total[2,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_5e6/en_lvl_norm_0.sav'
end_total[2,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_1e6/en_lvl_norm_0.sav'
end_total[2,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_5e5/en_lvl_norm_0.sav'
end_total[2,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_1e5/en_lvl_norm_0.sav'
end_total[2,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_5e4/en_lvl_norm_0.sav'
end_total[2,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t45/visc_1e4/en_lvl_norm_0.sav'
end_total[2,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t60/visc_5e7/en_lvl_norm_0.sav'
end_total[3,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_1e7/en_lvl_norm_0.sav'
end_total[3,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_5e6/en_lvl_norm_0.sav'
end_total[3,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_1e6/en_lvl_norm_0.sav'
end_total[3,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_5e5/en_lvl_norm_0.sav'
end_total[3,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_1e5/en_lvl_norm_0.sav'
end_total[3,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_5e4/en_lvl_norm_0.sav'
end_total[3,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t60/visc_1e4/en_lvl_norm_0.sav'
end_total[3,0] = en_lvl_norm[-1]


restore, 'visc_period_study/H20_nonstrat/t75/visc_5e7/en_lvl_norm_0.sav'
end_total[4,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_1e7/en_lvl_norm_0.sav'
end_total[4,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_5e6/en_lvl_norm_0.sav'
end_total[4,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_1e6/en_lvl_norm_0.sav'
end_total[4,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_5e5/en_lvl_norm_0.sav'
end_total[4,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_1e5/en_lvl_norm_0.sav'
end_total[4,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_5e4/en_lvl_norm_0.sav'
end_total[4,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t75/visc_1e4/en_lvl_norm_0.sav'
end_total[4,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t90/visc_5e7/en_lvl_norm_0.sav'
end_total[5,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_1e7/en_lvl_norm_0.sav'
end_total[5,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_5e6/en_lvl_norm_0.sav'
end_total[5,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_1e6/en_lvl_norm_0.sav'
end_total[5,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_5e5/en_lvl_norm_0.sav'
end_total[5,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_1e5/en_lvl_norm_0.sav'
end_total[5,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_5e4/en_lvl_norm_0.sav'
end_total[5,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t90/visc_1e4/en_lvl_norm_0.sav'
end_total[5,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t105/visc_5e7/en_lvl_norm_0.sav'
end_total[6,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_1e7/en_lvl_norm_0.sav'
end_total[6,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_5e6/en_lvl_norm_0.sav'
end_total[6,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_1e6/en_lvl_norm_0.sav'
end_total[6,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_5e5/en_lvl_norm_0.sav'
end_total[6,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_1e5/en_lvl_norm_0.sav'
end_total[6,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_5e4/en_lvl_norm_0.sav'
end_total[6,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t105/visc_1e4/en_lvl_norm_0.sav'
end_total[6,0] = en_lvl_norm[-1]

restore, 'visc_period_study/H20_nonstrat/t120/visc_5e7/en_lvl_norm_0.sav'
end_total[7,7] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_1e7/en_lvl_norm_0.sav'
end_total[7,6] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_5e6/en_lvl_norm_0.sav'
end_total[7,5] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_1e6/en_lvl_norm_0.sav'
end_total[7,4] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_5e5/en_lvl_norm_0.sav'
end_total[7,3] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_1e5/en_lvl_norm_0.sav'
end_total[7,2] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_5e4/en_lvl_norm_0.sav'
end_total[7,1] = en_lvl_norm[-1]
restore, 'visc_period_study/H20_nonstrat/t120/visc_1e4/en_lvl_norm_0.sav'
end_total[7,0] = en_lvl_norm[-1]


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

X = [15,15,15,15,15,15,15,15,$
     30,30,30,30,30,30,30,30,$
     45,45,45,45,45,45,45,45,$
     60,60,60,60,60,60,60,60,$
     75,75,75,75,75,75,75,75,$
     90,90,90,90,90,90,90,90,$
     105,105,105,105,105,105,105,105,$
     120,120,120,120,120,120,120,120]
Y = [1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7,$
     1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7]

; Set up coordinates for contour plot

cx = [15,30,45,60,75,90,105,120]
cy = [1e4,5e4,1e5,5e5,1e6,5e6,1e7,5e7]

; Set up labels and levels for thick contour lines

labelnames=[0.9,0.5,0.1]
clevels = [alog(1-labelnames[0]),alog(1-labelnames[1]),$
           alog(1-labelnames[2])]

; Set up colour table for coloured contour

loadct, 13
TVLCT, 255, 255, 255, 254 ; White color
TVLCT, 0, 0, 0, 253       ; Black color
!P.Color = 253
!P.Background = 254

; Set up window for plot

window, 1, YSIZE=600, XSIZE=800

; Create coloured contour

contour,alog(1.0-end_total),cx,cy, /fill, nlevels=100,XSTYLE=1,YSTYLE=1,yrange=[1e4,5e7],xrange=[15,120],/YLOG,POSITION=[0.15, 0.2, 0.95, 0.95], $
XTITLE= 'Period / T', YTITLE = 'Viscosity / m!E2!Ns!E-1', $
CHARTHICK= 2

; Set up colour table for thick contour lines

loadct,0
TVLCT, 255, 255, 255, 254 ; White color
TVLCT, 0, 0, 0, 253       ; Black color
!P.Color = 253
!P.Background = 254

; Overplot thick contour lines and add labels

contour, alog(1.0-end_total),cx,cy,levels=clevels,$
         C_THICK=2,/OVERPLOT,/YLOG

XYOUTS, 180, 500, '0.1', CHARSIZE=2, CHARTHICK=2, /DEVICE
XYOUTS, 230, 450, '0.5', CHARSIZE=2, CHARTHICK=2, /DEVICE
XYOUTS, 310, 360, '0.9', CHARSIZE=2, CHARTHICK=2, /DEVICE

; Overplot data point markers

symsize = 1.5
symX = [-symsize, 0, symsize, 0, -symsize]
symY = [0, symsize, 0, -symsize, 0]
USERSYM, symX, symY, /FILL
oplot, X,Y,psym=8

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

WRITE_PNG, 'Images/visc_period_grid.png', TVRD(/TRUE)

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
         XTICKNAME= ['0.00','0.60','0.84','0.93','0.97','0.99'], $
         XSTYLE = 1, XTICKS = divisions, $
         YSTYLE = 1, YTICKS = 1,         YTICKFORMAT = '(A1)', $
         POSITION = position, COLOR = color, CHARSIZE = charsize, $
         XRANGE = [min, max], TITLE = title, CHARTHICK = 2 
         
END
