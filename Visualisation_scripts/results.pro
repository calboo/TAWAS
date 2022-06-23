pro results

;; DESCRIPTION

; IDL script used to produce Figures 6 and 7 in the paper,
; Enhanced phase mixing of torsional Alfven waves in stratified and
; divergent solar coronal structures – Paper I. Linear solutions
; C.Boocock and D.Tsiklauri

; The normalised wave energy flux is plotted against height for six 
; different sets of parameters. For each set of parameters a seperate
; graph is plotted. On each graph the wave energy flux is plot using
; the outputs of norefl.pro, uncorr.pro and tawas.pro to demonstrate
; the effect of the wave reflection term and the correction to this
; term made in the analytic formula.

; The six sets of parameters used are as follows:
;
; 1 - hb=50 hp=50 (alpha=1) T=60
; 2 - hb=20 hp=nonstrat (alpha=0) T=60
; 3 - hb=20 hp=20 (alpha=1) T=60
; 4 - hb=20 hp=50 (alpha=2/5) T=60
; 5 - hb=20 hp=100 (alpha=1/5) T=60
; 6 - hb=20 hp=100 (alpha=1/5) T=120 
;
; For all run viscosity was set to 5x10^7

;; USAGE

; This script must be run in IDL, to run this script successfully
; the outputs from norefl.pro, uncorr.pro and tawas.pro for each
; set of parameters must have been produced and saved.
; The user must make sure the filepaths given in the script below
; correlate to the locations of the saved output data.

; Figures 6 and 7 correspond to the graphs produced from the
; fifth and sixth set of parameters.

;; SCRIPT

; Case 1
; hb=50 hp=50 (alpha=1) T=60

; Restore data from norefl outputs
restore, 'correction_study/norefl1/en_lvl_norm_0.sav'
restore, 'correction_study/norefl1/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0.95,1],YTICKFORMAT ='(F4.2)',FONT_SIZE=15,$
         XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl1/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl1/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl1/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl1/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case1.png"


; Case 2
; hb=20 hp=nonstrat (alpha=0) T=60

; Restore data from norefl outputs
restore, 'correction_study/norefl2/en_lvl_norm_0.sav'
restore, 'correction_study/norefl2/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0.95,1],YTICKFORMAT ='(F4.2)',FONT_SIZE=15,$
         XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl2/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl2/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl2/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl2/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case2.png"


; Case 3
; hb=20 hp=20 (alpha=1) T=60

; Restore data from norefl outputs
restore, 'correction_study/norefl3/en_lvl_norm_0.sav'
restore, 'correction_study/norefl3/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0.95,1],YTICKFORMAT ='(F4.2)',FONT_SIZE=15,$
         XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl3/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl3/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl3/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl3/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case3.png"


; Case 4
;  hb=20 hp=50 (alpha=2/5) T=60

; Restore data from norefl outputs
restore, 'correction_study/norefl4/en_lvl_norm_0.sav'
restore, 'correction_study/norefl4/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0.95,1],YTICKFORMAT ='(F4.2)',FONT_SIZE=15,$
         XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl4/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl4/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl4/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl4/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case4.png"


; Case 5
; hb=20 hp=100 (alpha=1/5) T=60

; Restore data from norefl outputs
restore, 'correction_study/norefl5/en_lvl_norm_0.sav'
restore, 'correction_study/norefl5/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0,1],YTICKFORMAT ='(F3.1)',FONT_SIZE=15,$
          XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl5/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl5/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl5/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl5/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case5.png"


; Case 6
; hb=20 hp=100 (alpha=1/5) T=120

; Restore data from norefl outputs
restore, 'correction_study/norefl6/en_lvl_norm_0.sav'
restore, 'correction_study/norefl6/zscale.sav'

; Plot normalised wave energy against height
p1 = PLOT(zscale/1e6, en_lvl_norm,"blue",LINESTYLE=3,THICK=3,$
         YRANGE=[0,1],YTICKFORMAT ='(F3.1)',FONT_SIZE=15,$
          XTITLE='Height / Mm',YTITLE='Normalised Wave Energy Flux')

; Restore data from uncorr outputs
restore, 'correction_study/uncorr_refl6/en_lvl_norm_0.sav'
restore, 'correction_study/uncorr_refl6/zscale.sav'

; Overplot normalised wave energy against height
p2 = PLOT(zscale/1e6, en_lvl_norm,"red",LINESTYLE=2,THICK=3,/OVERPLOT)

; Restore data from TAWAS outputs
restore, 'correction_study/corr_refl6/en_lvl_norm_0.sav'
restore, 'correction_study/corr_refl6/zscale.sav'

; Overplot normalised wave energy against height
p3 = PLOT(zscale/1e6, en_lvl_norm,"black",LINESTYLE=0,THICK=3,/OVERPLOT)

; Save image as png file
p1.save, "Images/correction_case6.png"

end
