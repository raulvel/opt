function [Vf] = Tabel( P )
%TABEL Summary of this function goes here
%   Detailed explanation goes here
  
if (P>=100 && P<=200)
    U_Gnom=15;
     U_E_nom=300;
    U_PC_nom=270;
else
    if (P>=201 && P<=300)
        
        U_Gnom=20;
       U_E_nom=400;
       U_PC_nom=270;
    else
        if (P>=301 && P<=400)
            U_Gnom=25;
           U_E_nom=500;
            U_PC_nom=360;
        else
            U_Gnom=30;
           U_E_nom=600;
            U_PC_nom=360;
        end
    end    
end
 
if(P>=100 && P<=150)
    T_EE=0.1;
    T_E=0.5;
    T_G=4;
else
   if(P>=150 && P<=300)
    T_EE=0.1;
    T_E=0.75;
    T_G=4;
   else 
       if(P>=301 && P<=400)
            T_EE=0.1;
            T_E=0.75;
            T_G=5;
       else
           if(P>=401 && P<=500)
            T_EE=0.15;
            T_E=1;
            T_G=5;
           else
           if(P>500)
            T_EE=0.2;
            T_E=1;
            T_G=6;
           else
           end
           
           end
           
       end
   end
end
Vf=[U_Gnom,U_E_nom,U_PC_nom,T_EE,T_E,T_G];

end


