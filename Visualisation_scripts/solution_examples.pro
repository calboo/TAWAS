pro solution_examples

;; DESCRIPTION

; IDL script used to produce Figures 3,4 and 5 in the paper,
; Enhanced phase mixing of torsional Alfven waves in stratified and
; divergent solar coronal structures – Paper I. Linear solutions
; C.Boocock and D.Tsiklauri

; Coloured contours of both the azimuthal velocity and magnetic field
; perturbations are plotted againt the radius, z, and height, z.
; Additionally a line plot of the normalised wave energy flux is
; plotted against height.

;; USAGE

; This script must be run in IDL using input data produced by TAWAS,
; the directory containing this data must be specified in the script,
; under the variable name dir.

; The contour levels will need to be adjusted depending
; on the parameters being considered.

; Figures 3,4 and 5 were produced using data from a TAWAS run
; with the parameters H = 20 Mm, H_rho= 100 Mm, T = 60 s,
; u0 = 100 kms-1 and viscosity= 5 ×10^7 m2s−1.

;; SCRIPT

; Specify directory for input
dir = 'Data'

; Read TAWAS data from directory dir
restore, dir+'/v.sav'
restore, dir+'/b.sav'
restore, dir+'/en_lvl_norm_0.sav'
restore, dir+'/zscale.sav'

; Set up coordinates for plots
r = 40*findgen(501)/500
z = 100*findgen(2001)/2000


; Plot contour of azimuthal velocity perturbation
v = real_part(v)
ct = colortable(5)
clevels = 50*(findgen(101)/50-1.0)
w1 = WINDOW(DIMENSIONS=[1000,700])
c1 = CONTOUR(v/1e3,r,z, SHADING=1, /FILL, RGB_TABLE=ct, N_LEVELS=100,$
             XTITLE='r / Mm',YTITLE='z / Mm',FONT_SIZE=20,$
             C_VALUE=clevels,POSITION=[0.12,0.25,0.9,0.95],/CURRENT)
cb = COLORBAR(TARGET=c1,TITLE='Velocity / kms!E-1',$
              POSITION=[0.1,0.12,0.9,0.15],FONT_SIZE=20)

; Plot contour of azimuthal magnetic field perturbation
b = real_part(bwave)
ct = colortable(5)
clevels = 5e1*(findgen(101)/50-1.0)
w2 = WINDOW(DIMENSIONS=[1000,700])
c2 = CONTOUR(b*1e6,r,z, SHADING=1, /FILL, RGB_TABLE=ct, N_LEVELS=100,$
             XTITLE='r / Mm',YTITLE='z / Mm',FONT_SIZE=20,$
             C_VALUE=clevels,POSITION=[0.12,0.25,0.9,0.95],/CURRENT)
cb = COLORBAR(TARGET=c2,TITLE='Magnetic field / $\mu$T',$
              POSITION=[0.1,0.12,0.9,0.15],FONT_SIZE=20)

; Plot normalised wave energy flux against height
p1 = plot(zscale/1e6, en_lvl_norm, THICK=3, $
          XTITLE= 'Height / Mm', YTITLE= 'Normalised Wave Energy Flux', $
         FONT_SIZE=15,YRANGE=[0.0,1.0])

; Save images to png files
c1.save, "Images/v_example.png"
c2.Save, "Images/b_example.png"
p1.save, "Images/energy_example.png"

end
