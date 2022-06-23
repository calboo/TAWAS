pro field_lines

;; DESCRIPTION

; IDL script used to produce Figure 2 in the paper,
; Enhanced phase mixing of torsional Alfven waves in stratified and
; divergent solar coronal structures – Paper I. Linear solutions
; C.Boocock and D.Tsiklauri

; The density and magnetic field across the domain are calculated.
; A coloured contour of the density is plotted against the radius, r,
; and height, z, to illustrate the central higher density tube and the
; exponential decrease in density with height. A contour line is
; overplotted over the coloured contour to show the position of the
; tube boundary psi = psib.

;; USAGE

; This script can be run directly in IDL without any external inputs.
; The simulation parameters can be altered within this script.
; Figure 2 was produced using the parameters given below.

;; SCRIPT

;; Constants
  
; Vacuum permeability
  mu0 = 4.0d0*!dpi*1.0d-7
; Background field strength and density
  b0 = 1.0d-3
  rho0 = 1.0d0*1.66d-12

;; Parameters
  
; Resolution and domain dimensions
  rsize = 50
  zsize = 200
  rdim = 40.0d6
  zdim = 100.0d6
; Scale heights, tube radius and density contrast
  H = 20.0d6
  alpha = 2.0d0/10.0d0 ; NB alpha = H/H_rho0
  r0 = 5.0d6
  zeta = 5.0d0

;; Initialise arrays
  
; Coordinates
  r = findgen(rsize+1)*rdim/rsize
  z = findgen(zsize+1)*zdim/zsize
; Background values
  Br = dblarr(rsize+1,zsize+1)
  Bz = dblarr(rsize+1,zsize+1)
  B = dblarr(rsize+1,zsize+1)
  phi = dblarr(rsize+1,zsize+1)
  psi = dblarr(rsize+1,zsize+1)
  rhohat = dblarr(rsize+1,zsize+1)
  rho = dblarr(rsize+1,zsize+1)
  va = dblarr(rsize+1,zsize+1)

;; Calculate density and magnetic field
  
; Calculate psi at boundary
  psib = r0*beselj(r0/H,1)
; Calculate characteristic Alfen speed
  v0 = b0/sqrt(mu0*rho0)
; Calculate field line coordinates
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        phi(i,j) = -H*exp(-z(j)/H)*beselj(r(i)/H,0)
        psi(i,j) = r(i)*exp(-z(j)/H)*beselj(r(i)/H,1)
     endfor
  endfor
; Calculate B-field, density and Alfven speed  
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        Br(i,j) = b0*exp(-z(j)/H)*beselj(r(i)/H,1)
        Bz(i,j) = b0*exp(-z(j)/H)*beselj(r(i)/H,0)
        B(i,j) = sqrt(Br(i,j)^2.0d0+Bz(i,j)^2.0d0)

        ; Density profile 
        ; From paper by Ruderman and Petrukhin
        if (psi(i,j) LT psib) then begin
           rhohat(i,j)= rho0*(1.0d0+(zeta-1.0d0)*(1.0d0-(psi(i,j)/psib))^2.0d0)/zeta
        endif else begin
           rhohat(i,j)= rho0*1.0d0/zeta
        endelse

        rho(i,j) = rhohat(i,j)*exp(-alpha*z(j)/H)
        va(i,j)  = B(i,j)/sqrt(mu0*rho(i,j))
     endfor
  endfor

;; Plot density and field lines

; Plot density contour
ct1 = COLORTABLE(3)
w = WINDOW(DIMENSIONS=[1000,700])
clevels = (findgen(100)/100)
c1 = CONTOUR(rho/1.66e-12, r/1e6,z/1e6, /FILL, C_VALUE=clevels, RGB_TABLE=ct1,$
             XTITLE='r / Mm',YTITLE='z / Mm',FONT_SIZE=20, /CURRENT, $
             POSITION=[0.12,0.25,0.9,0.95]) ;,XTICKFORMAT='(A1)',YTICKFORMAT='(A1)')

; Add colour bar
cb = COLORBAR(TARGET=c1,TITLE='Density / $\rho$!I0',$
              POSITION=[0.1,0.12,0.9,0.15],FONT_SIZE=20)

; Add tube boundary contour and label
cpsi = CONTOUR(psi, r/1e6,z/1e6, C_VALUE=psib, C_THICK =3, RGB_TABLE=ct2, /OVERPLOT,C_LABEL_SHOW=0)
t2 = TEXT(30,75,'$\psi = \psi_b$', COLOR='white',FONT_SIZE=20,/DATA)

; Save image to png file
c1.Save, "Images/field_line_example.png"

end
