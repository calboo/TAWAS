pro uncorr_refl

  TIC

;; Constants
; vacuum permeability
  mu0 = 4.0d0*!dpi*1.0d-7
; background field strength and density
  b0 = 1.0d-3
  rho0 = 1.0d0*1.66d-12

;; Parameters
; resolution and domain dimensions
  rsize = 500
  zsize = 2000
  rdim = 40.0d6
  zdim = 100.0d6
; Scale heights, tube radius and density contrast
  H = 20.0d6
  alpha = 1.0d0
  r0 = 5.0d6
  zeta = 5.0d0
; wave amplitude, frequency and phase
  u0 = 1.0d3
  period = 120.0d0
  omega = 2.0d0*!dpi/period
  t = 0.0d0 
; viscosity
  viscosity = 5.0d7
; Plot graphs 
; 1 for all
; 2 for just field lines and density
; 3 for just v and b wave solutions
; 4 for just wave energy graphs
  plotting = 0

;; output directory
  save_dir= 'correction_study/uncorr_refl3'
  run_name= ''
  save_loc = save_dir+run_name

;; Initialise arrays
; coordinates
  r = findgen(rsize+1)*rdim/rsize
  z = findgen(zsize+1)*zdim/zsize
; background values 

  Br = dblarr(rsize+1,zsize+1)
  Bz = dblarr(rsize+1,zsize+1)
  B = dblarr(rsize+1,zsize+1)
  phi = dblarr(rsize+1,zsize+1)
  psi = dblarr(rsize+1,zsize+1)
  rhohat = dblarr(rsize+1,zsize+1)
  rho = dblarr(rsize+1,zsize+1)
  va = dblarr(rsize+1,zsize+1)
; calculated arrays
  hint = dblarr(rsize+1,zsize+1)
  hparam = dblarr(rsize+1,zsize+1)
  dhdpsi = dblarr(rsize+1,zsize+1)
  Upsilon = dblarr(rsize+1,zsize+1)
  refl = dblarr(rsize+1,zsize+1)
  intups0 = dblarr(rsize+1,zsize+1)
  intrefl0 = dblarr(rsize+1,zsize+1)
  nphi = dblarr(rsize+1,zsize+1)
  diss_ups = dcomplexarr(rsize+1,zsize+1)
  diss_refl = dcomplexarr(rsize+1,zsize+1)
  diss = dcomplexarr(rsize+1,zsize+1)
  Q = dcomplexarr(rsize+1,zsize+1)
  A0 = dcomplexarr(rsize+1,zsize+1)
  W = dcomplexarr(rsize+1,zsize+1)
  W_b = dcomplexarr(rsize+1,zsize+1)
  v_env = dcomplexarr(rsize+1,zsize+1)
  v = dcomplexarr(rsize+1,zsize+1)
  b_env = dcomplexarr(rsize+1,zsize+1)
  bwave = dcomplexarr(rsize+1,zsize+1)
  sigma = dblarr(rsize+1,zsize+1)
  waven = dblarr(rsize+1,zsize+1)

;;  Calculate psi at boundary
  psib = r0*beselj(r0/H,1)

;;  Calculate characteristic Alfen speed
  v0 = b0/sqrt(mu0*rho0)

;;  Calculate field line coordinates
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        phi(i,j) = -H*exp(-z(j)/H)*beselj(r(i)/H,0)
        psi(i,j) = r(i)*exp(-z(j)/H)*beselj(r(i)/H,1)
     endfor
  endfor

;;  Calculate B-field, density and Alfven speed  
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        Br(i,j) = b0*exp(-z(j)/H)*beselj(r(i)/H,1)
        Bz(i,j) = b0*exp(-z(j)/H)*beselj(r(i)/H,0)
        B(i,j) = sqrt(Br(i,j)^2.0d0+Bz(i,j)^2.0d0)

        ;; Density profile 
        ;; From paper by Ruderman and Petrukhin
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
  if (plotting EQ 1) or (plotting EQ 2) then begin
     window,1
     nlvl=50
     lvlphi= fltarr(nlvl)
     for i= 0,nlvl-1 do begin
        lvlphi(i) = min(phi)+(i^0.5d0)*(max(phi)-min(phi))/((nlvl-1)^0.5d0)
     endfor
     lvlpsi= fltarr(nlvl)
     for i= 0,nlvl-1 do begin
        lvlpsi(i) = min(psi)+(i^2.0d0)*(max(psi)-min(psi))/((nlvl-1)^2.0d0)
     endfor
     contour, alog(rho),r/1e6,z/1e6,/fill,nlevels=100,XTITLE='r / Mm',YTITLE='z / Mm'
     contour, psi,levels=lvlpsi,r/1e6,z/1e6, /overplot
     contour, phi,levels=lvlphi,r/1e6,z/1e6, /overplot 
  endif

;; Integrate to find the phase parameter h
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        hint(i,j) = (b0*v0)/(va(i,j)*B(i,j))
     endfor
  endfor
  for i = 0,rsize do begin
     for j = 1,zsize do begin
        phi_line = []
        hint_line = []
        for j1= 0,j-1 do begin
           p1=value_locate(psi[*,j1],psi(i,j))
           p2 = p1+1
           phi_i = phi(p1,j1)+(psi(i,j)-psi(p1,j1))*(phi(p2,j1)-phi(p1,j1))/(psi(p2,j1)-psi(p1,j1))
           hint_i = hint(p1,j1)+(psi(i,j)-psi(p1,j1))*(hint(p2,j1)-hint(p1,j1))/(psi(p2,j1)-psi(p1,j1))
           phi_line = [phi_line, phi_i]
           hint_line= [hint_line,hint_i]
        endfor
        phi_line = [phi_line, phi(i,j)]
        hint_line= [hint_line,hint(i,j)]
        hparam(i,j) = int_tabulated(phi_line,hint_line)
     endfor
     print, i
  endfor

;; Differentiate for dh/dpsi
  for i = 1,rsize-1 do begin
     for j = 1,zsize-1 do begin
        i1 =i-1
        i2 = i+1
        p11 = value_locate(phi[i1,*],phi(i,j))
        p12 = p11+1
        if (p12 LE zsize) then begin
           p21 = value_locate(phi[i2,*],phi(i,j))
           p22 = p21+1
           if (p22 LE zsize) then begin
              h_i1 = hparam(i1,p11)+(phi(i,j)-phi(i1,p11))*(hparam(i1,p12)-hparam(i1,p11))/(phi(i1,p12)-phi(i1,p11))
              psi_i1 = psi(i1,p11)+(phi(i,j)-phi(i1,p11))*(psi(i1,p12)-psi(i1,p11))/(phi(i1,p12)-phi(i1,p11))
              h_i2 = hparam(i2,p21)+(phi(i,j)-phi(i2,p21))*(hparam(i2,p22)-hparam(i2,p21))/(phi(i2,p22)-phi(i2,p21))
              psi_i2 = psi(i2,p21)+(phi(i,j)-phi(i2,p21))*(psi(i2,p22)-psi(i2,p21))/(phi(i2,p22)-phi(i2,p21))
              dhdpsi(i,j) = (h_i2-h_i1)/(psi_i2-psi_i1)
           endif else begin
              dhdpsi(i,j) = 2.0d0*dhdpsi(i,j-1)-dhdpsi(i,j-2)
           endelse
        endif else begin
           dhdpsi(i,j) = 2.0d0*dhdpsi(i,j-1)-dhdpsi(i,j-2)
        endelse
     endfor
  endfor
  for i = 1,rsize-1 do begin
     dhdpsi(i,0) = 2.0d0*dhdpsi(i,1)-dhdpsi(i,2)
     dhdpsi(i,zsize) = 2.0d0*dhdpsi(i,zsize-1)-dhdpsi(i,zsize-2)
  endfor
  for j = 0,zsize do begin
     dhdpsi(0,j) = 2.0d0*dhdpsi(1,j)-dhdpsi(2,j)
     dhdpsi(rsize,j) = 2.0d0*dhdpsi(rsize-1,j)-dhdpsi(rsize-2,j)
  endfor

;; Calculate Upsilon
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        Upsilon(i,j) = (viscosity*omega^2.0d0)*(r(i)^2.0d0)*sqrt(rho(i,j))*(dhdpsi(i,j)^2.0d0)/(2.0d0*(v0^3.0d0)*(H^2.0d0)*sqrt(rho0))
     endfor
  endfor

;; Calculate Reflective Term
  for i = 1,rsize do begin
     for j = 0,zsize do begin
        refl(i,j) = ((psi(i,j)/r(i))^2.0d0)*((H^2.0d0/r(i)^2.0d0)-alpha/4.0d0)-((alpha*(4.0d0-alpha)*phi(i,j)^2.0d0)/(16.0d0*H^2.0d0))   
        refl(i,j) = refl(i,j)*v0/(2.0d0*omega*(H^2.0d0))
        refl(i,j) = refl(i,j)*sqrt(rho0/rho(i,j))*((b0/B(i,j))^2.0d0)
     endfor
  endfor
  for j = 0,zsize do begin
     refl(0,j) = ((alpha-2.0d0)/4.0d0)^2.0d0
     refl(0,j) = refl(0,j)*(v0/(2.0d0*omega*(H^2.0d0)))* sqrt(rho0/rho(0,j))
  endfor

;; Integrate to find intups = integral of Upsilon dphi
;; and intrefl = integral of refl dphi

  for i = 0,rsize do begin
     for j = 0,zsize do begin
        intups0(i,j) = -phi(i,j)*Upsilon(i,j)
        intrefl0(i,j) = -phi(i,j)*refl(i,j)
        nphi(i,j) = alog(-phi(i,j))
     endfor
  endfor

  for i = 0,rsize do begin
     for j = 1,zsize do begin
        phi_line = []
        intups_int= []
        intrefl_int= []
        for j1= 0,j-1 do begin
           p1 = value_locate(psi[*,j1],psi(i,j))
           p2 = p1+1
           phi_i = nphi(p1,j1)+(psi(i,j)-psi(p1,j1))*(nphi(p2,j1)-nphi(p1,j1))/(psi(p2,j1)-psi(p1,j1))
           intups_i = intups0(p1,j1)+(psi(i,j)-psi(p1,j1))*(intups0(p2,j1)-intups0(p1,j1))/(psi(p2,j1)-psi(p1,j1))
           intrefl_i = intrefl0(p1,j1)+(psi(i,j)-psi(p1,j1))*(intrefl0(p2,j1)-intrefl0(p1,j1))/(psi(p2,j1)-psi(p1,j1))
           phi_line = [phi_line, phi_i]
           intups_int = [intups_int, intups_i]
           intrefl_int = [intrefl_int, intrefl_i]
        endfor
        phi_line = [phi_line, nphi(i,j)]
        intups_int = [intups_int, intups0(i,j)]
        intrefl_int = [intrefl_int, intrefl0(i,j)]

        phi_line = reverse(phi_line)
        intups_int= reverse(intups_int)
        intrefl_int= reverse(intrefl_int)

        diss_ups(i,j) = int_tabulated(phi_line,intups_int)
        diss_refl(i,j) = int_tabulated(phi_line,intrefl_int)
     endfor
     print, i
  endfor

  diss = diss_ups + diss_refl

;; Calculate Q
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        Q(i,j) = exp(-diss(i,j))
     endfor
  endfor

;; Calculate A0 and W
  for i = 0,rsize do begin
     for j = 0,zsize do begin

        ;; Driving function 
        ;; From paper by Ruderman and Petrukhin
        if (psi(i,j) LT psib) then begin
           A0(i,j) =((rhohat(i,j)/rho0)^0.25d0)*((psi(i,j)/psib)^0.5d0)*(1.0d0-(psi(i,j)/psib))
        endif else begin
           A0(i,j) =0.0d0
        endelse

     endfor
  endfor

;; Calculate and plot the velocity perturbation
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        W(i,j) = Q(i,j)*A0(i,j)*(rho0/rho(i,j))^0.25d0
        v_env(i,j) = u0*W(i,j)
        v(i,j) = v_env(i,j)*exp(complex(0,1)*omega*((hparam(i,j)/v0)-t))
     endfor
  endfor
  if (plotting EQ 1) or (plotting EQ 3) then begin
     window, 10
     shade_surf,v,r/1e6,z/1e6,XTITLE='r / Mm',YTITLE='z / Mm',ZTITLE='Velocity / ms-1'
     window, 11
     contour,v,r/1e6,z/1e6,/fill,nlevels=50,XTITLE='r / Mm',YTITLE='z / Mm'
  endif

;; Calculate W_b
  for i = 1,rsize do begin
     for j = 0,zsize do begin
        W_b(i,j) = (-Upsilon(i,j)-refl(i,j))*(B(i,j)/b0)
        W_b(i,j) = W_b(i,j)-(phi(i,j)*b0*alpha)/(4.0d0*H^2.0d0*B(i,j))
        W_b(i,j) = W_b(i,j)-(b0*psi(i,j))/(B(i,j)*r(i)^2.0d0)
        W_b(i,j) = W_b(i,j)*complex(0,1)*W(i,j)/(omega)
        W_b(i,j) = W_b(i,j)-(W(i,j)/va(i,j))
        b_env(i,j) = -u0*B(i,j)*W_b(i,j)
     endfor
  endfor
  for j = 0,zsize do begin
     W_b(0,j) = 0
  endfor

;; Calculate and plot the magnetic perturbation
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        bwave(i,j) = -b_env(i,j)*exp(complex(0,1)*omega*((hparam(i,j)/v0)-t))
     endfor
  endfor
  if (plotting EQ 1) or (plotting EQ 3) then begin
     window, 20
     shade_surf, bwave,XTITLE='r / Mm',YTITLE='z / Mm',ZTITLE='Magnetic field perturbation / T'
     window, 21
     contour, bwave, /fill, nlevels=50,XTITLE='r / Mm',YTITLE='z / Mm'
  endif

;; WKB Coefficient
  for i = 1,rsize do begin
     for j = 0,zsize do begin
        sigma(i,j) = ((psi(i,j)/r(i))^2.0d0)*((H^2.0d0/r(i)^2.0d0)-alpha/4.0d0)-((alpha*(4.0d0-alpha)*phi(i,j)^2.0d0)/(16.0d0*H^2.0d0))   
        sigma(i,j) = sigma(i,j)*rho0/rho(i,j)
     endfor
  endfor
  for j = 0,zsize do begin
     sigma(0,j) = ((alpha-2.0d0)/4.0d0)^2.0d0
     sigma(0,j) = sigma(0,j)*(rho0*B(0,j)^2.0d0)/(rho(0,j)*b0^2.0d0)
  endfor
  print, max(sigma)
  print, (omega*H/v0)^2.0d0

;; Calculate integrand for wave energy
  for i = 0,rsize do begin
     for j = 0,zsize do begin
        waven(i,j) = ((!dpi*b0*H)/mu0)*(real_part(v_env[i,j])*real_part(b_env[i,j]))
     endfor
  endfor

;; Plot Integrand for wave energy and field lines
  if (plotting EQ 1) or (plotting EQ 4) then begin
     window, 5, xsize=800, ysize=600
     contour,  alog(waven+1.0d-12), /fill, nlevels=100,XTITLE='r / Mm',YTITLE='z / Mm'
  endif

;;  Integrate wave energy across field lines at each height 
;;  (also overplots paths for each integration)

  zscale = [] 
  hscale = []
  en_lvl = []
  z0 = -H*alog(beselj(r0/H,0))
  zlevels = zsize

  for k= 0,zlevels-1 do begin
     z_en = k*zdim/zlevels
     if (z_en LT z0) then begin 
        print, string(100*float(k)/float(zlevels),FORMAT='(f4.1)')+' %',' too low'
     endif else begin
        phi1 = -H*exp(-z_en/H)
        i = 0
        pointi =[]
        pointj =[]
        psi_int = []
        waven_int = []
        while (i LT rsize) do begin
           p1 = value_locate(phi[i,*],phi1)
           p2 = p1+1
           if (p2 GT zsize) then break
           psi_i = psi(i,p1)+(phi1-phi(i,p1))*(psi(i,p2)-psi(i,p1))/(phi(i,p2)-phi(i,p1))
           waven_i = waven(i,p1)+(phi1-phi(i,p1))*(waven(i,p2)-waven(i,p1))/(phi(i,p2)-phi(i,p1))
           if (psi_i GE psib) then break
           pointi = [pointi, i]
           pointj = [pointj,p2]
           waven_int = [waven_int, waven_i]
           psi_int = [psi_int, psi_i]
           i = i+1 
        endwhile
        print, string(100*float(k)/float(zlevels),FORMAT='(f4.1)')+' %'
        if (plotting EQ 1) or (plotting EQ 4) then oplot, pointi,pointj
        en1 = int_tabulated(psi_int,waven_int)
        zscale = [zscale, z_en]
        hscale = [hscale, z_en/H]
        en_lvl = [en_lvl, en1]
     endelse
  endfor 
  en_lvl_norm = en_lvl/(en_lvl[0])

; Plot total wave energy 

  if (plotting EQ 1) or (plotting EQ 4) then begin
     window, 2
     plot,zscale/1e6,en_lvl,YTITLE='Wave Power / W',XTITLE='z / Mm'
     window, 3
     plot,zscale/1e6,en_lvl_norm,YTITLE='Normalised Wave Power',XTITLE='z / Mm'
  endif

;;  Save to data files
  save, rho, filename= save_loc+'/rho.sav'
  save, phi, filename= save_loc+'/phi.sav'
  save, psi, filename= save_loc+'/psi.sav'
  save, hparam, filename= save_loc+'/h.sav'
  save, W, filename= save_loc+'/w.sav'
  save, v_env, filename= save_loc+'/v_env.sav'
  save, b_env, filename= save_loc+'/b_env.sav'
  save, v, filename= save_loc+'/v.sav'
  save, bwave, filename= save_loc+'/b.sav'
  save, sigma, filename= save_loc+'/sigma.sav'
  save, br, filename= save_loc+'/br.sav'
  save, bz, filename= save_loc+'/bz.sav' 
  save, rho, filename= save_loc+'/rho.sav'
  save, phi, filename= save_loc+'/phi.sav'
  save, psi, filename= save_loc+'/psi.sav'
  save, hparam, filename= save_loc+'/h.sav'
  save, W, filename= save_loc+'/w.sav'
  save, v_env, filename= save_loc+'/v_env.sav'
  save, b_env, filename= save_loc+'/b_env.sav'
  save, v, filename= save_loc+'/v.sav'
  save, bwave, filename= save_loc+'/b.sav'
  save, sigma, filename= save_loc+'/sigma.sav'
  save, br, filename= save_loc+'/br.sav'
  save, bz, filename= save_loc+'/bz.sav'
  save, zscale, filename= save_loc+'/zscale.sav'
  save, hscale, filename= save_loc+'/hscale.sav'
  save, en_lvl, filename= save_loc+'/en_lvl_0.sav'
  save, en_lvl_norm, filename=save_loc+'/en_lvl_norm_0.sav'

  TOC

end
