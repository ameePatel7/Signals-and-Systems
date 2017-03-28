


///////////////////////////////////////////////////////////////////////CODER//////////////////////////////////////////////////////////////////////////////////////////////////////

 //                               AMEE BHUVA  :(1401009)
 //                               SUBHASHI DOBARIYA :(1401012)
//                                
//                                BATCH NO : 2015
//                                SUBJECT : AUTOMATIC COMPOSITION OF MUSIC USING GUI

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
clear;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ENVELOPE
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function  tone  = noteG( s,n,d)
//s denotes saptak (1,2,3). n denotes the
//note number s =2 and n =0 is the base note
// number.This will generate madhya saptak Sa
 
if s == 1                         
    N = 2^(n/12);
elseif s == 2
        N = 2*2^(n/12);
    else N = 4*2^(n/12);
end
f = 250;
f1 = f*N;
t = 0:1/22050:d;
//a =0.8* exp(-t/1.5*d) //+ 0.2*sin(6*%pi*t/d);
//a = (5*t/d).*a;
T = length(t);
T1 = round(0.02*T);
T2 = round(0.04*T);
T3 =  round(0.88*T);
L1 = linspace(0,1,T1);
L2 = linspace(1,1,T2);
L3 = linspace(1,0.9,T2);
L4 = linspace(0.9, 0.45,T3);
L5 = linspace(0.45,0,T1);
a = [L1 L2 L3 L4 L5 ];
A = length(a);
if T > A then
    diff = T-A;
    for i = 1:diff
        a = [a 0];
    end
    
elseif T < A then
        diff = A-T;
        for i = 1:diff
            t = {t 0};
        end
        
        
end
Tnew = length(t);
Anew = length(a);

S = sin((2*%pi*f1*t + a.*sin(4*%pi*f1*t) ));

tone = a.*S;
endfunction

g=0;
try
 getversion("scilab");
catch
 error("Scilab 5.0 or more is required.");
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUI FOR SELECTING CATEGORY
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

funcprot(0);
stacksize('max');
f=figure('figure_position',[400,50],'figure_size',[656,607],'auto_resize','on','background',[50],'figure_name','Automatic Composition');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.C0=uicontrol(f,'unit','normalized','BackgroundColor',[0,0,0],'Enable','on','FontAngle','italic','FontName','algerian','FontSize',[30],'FontUnits','points','FontWeight','bold','ForegroundColor',[1,1,1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3278125,0.8130159,0.41,0.11],'Relief','raised','SliderStep',[0.01,0.1],'String','Categories','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','C0','Callback','C0_callback(handles)')
handles.C1=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[16],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.5530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','HAPPY','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','C1','Callback','C1_callback(handles)')
handles.C2=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[16],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.4130159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','SAD','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','C2','Callback','C2_callback(handles)')
handles.C3=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[16],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.2530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','ROMANTIC','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','C3','Callback','C3_callback(handles)')

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUI FOR SELECTING SCALE OF HAPPY SONG
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function C0_callback(handles)
//Write your callback for  C0  here

endfunction

function C1_callback(handles)
f=figure('figure_position',[400,50],'figure_size',[656,607],'auto_resize','on','background',[50],'figure_name','Scale Selection');
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.R0=uicontrol(f,'unit','normalized','BackgroundColor',[0,0,0],'Enable','on','FontAngle','italic','FontName','algerian','FontSize',[30],'FontUnits','points','FontWeight','normal','ForegroundColor',[1,1,1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3278125,0.8130159,0.41,0.11],'Relief','raised','SliderStep',[0.01,0.1],'String','SELECT SCALE','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R0','Callback','R0_callback(handles)')
handles.R1=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.5530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','3/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R1','Callback','R1_callback(handles)')
handles.R2=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.4130159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','4/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R2','Callback','R2_callback(handles)')
handles.R3=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.2530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','6/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R3','Callback','R3_callback(handles)')
endfunction

function R0_callback(handles)
    //
endfunction
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//3/4 HAPPY SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Combinations Possible For 3/4 Scale
//* 3 quarter notes
//* 2 1/8th notes + 2 quarter notes
//* 4 1/8th notes + 1 quarter note
//* 8 1/16th notes + 1 quarter note
//* 4 1/16th notes + 2 quarter notes
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function R1_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];


    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);//[A11 A12 A13 A13 A14 A15    A13 A14 A15 A15 A16 A17    A15 A16 A17 A17 A18 A19    A17 A18 A19 A19 A20];
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A12 A13 A14    A14 A15 A16    A35 A36 A36 A37 A37 A38    A18 A17 A16];
S2 = [A16 A17 A18    A38 A37 A37 A36 A36 A35    A16 A15 A14    A14 A13 A12];
S3 = [S1 S2];

S4 = [A52 A53    A12 A13 A14    A13 A14 A15    A14 A15 A16];
S5 = [A16 A15 A14    A15 A14 A13    A14 A13 A12    A53 A52];
S6 = [A31 A32 A32 A33 A33 A34    A14 A15 A16   A35 A36 A36 A37 A37 A38 ];
S7 = [A38 A37 A37 A36 A36 A35    A16 A15 A14    A34 A33 A33 A32 A32 A31];
S8 = [S4 S5 S6 S7];

S9 = [S3 S8 S3];
sound(S9);
endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//4/4 HAPPY SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Combinations Possible For 4/4 Scale
//* 4 quarter notes
//* 8 1/8th notes
//* 4 1/16th notes + 3 quarter notes
//* 4 1/8th notes + 2 quarter notes
//* 8 1/16th notes + 2 quarter notes
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function R2_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A11 A12 A13 A14    A13 A14 A15 A16    A15 A16 A17 A18    A17 A18 A29];
S2 = [A10 A19 A18 A17    A18 A17 A16 A15    A16 A15 A14 A13    A14 A13  A22];
S3 = [S1 S2];

S4 = [A14 A15 A16 A17    A36 A37 A37 A38 A38 A39 A39 A30    A10 A19 A18 A17    A38 A37 A37 A36 A36 A35 A35 A34];
S5 = [A34 A35 A35 A36 A36 A37 A37 A38    A17 A18 A19 A10    A30 A39 A39 A38 A38 A37 A37 A36    A17 A16 A25];
S6 = [S4 S5];

S7 = [S3 S6 S3];
sound(S7);

endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//6/4 HAPPY SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Combinations Possible For 6/4 Scale
//* 6 quarter notes
//* 3 quarter notes + 1 dotted minim
//* 2 quarter notes + 2 dotted minim
//* 4 1/16th notes + 5 quarter notes
//* 3 quarter notes + 2 1/8th notes + 1 half note
//* 2 dotted minims
//* 1 quarter note + 4 1/16th notes + 2 minims
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function R3_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A11 A12 A13 A13 A14 A15       A16 A37 A38 A37 A38 A38 A39 A38 A39 A10 ];
S2 = [S1 S1];
S3 = [A10 A39 A38 A39 A38 A38 A37 A38 A37 A16      A15 A14 A13 A13 A12 A21];
S4 = [S2 S3 S1];
sound(S4);

endfunction


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUI FOR SELECTING SCALE OF SAD SONG
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function C2_callback(handles)
f=figure('figure_position',[400,50],'figure_size',[656,607],'auto_resize','on','background',[50],'figure_name','Scale Selection');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.R0=uicontrol(f,'unit','normalized','BackgroundColor',[0,0,0],'Enable','on','FontAngle','italic','FontName','algerian','FontSize',[30],'FontUnits','points','FontWeight','normal','ForegroundColor',[1,1,1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3278125,0.8130159,0.41,0.11],'Relief','raised','SliderStep',[0.01,0.1],'String','SELECT SCALE','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R0','Callback','R0_callback(handles)')
handles.R4=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.5530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','3/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R1','Callback','R4_callback(handles)')
handles.R5=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.4130159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','4/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R2','Callback','R5_callback(handles)')
handles.R6=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.2530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','6/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R3','Callback','R6_callback(handles)')
endfunction

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//3/4 SAD SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R4_callback(handles)
funcprot(0);
stacksize('max');

d1=0.5;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A26 A16   A15 A24   A23 A12   A11 A21];
S2 = [A21 A11   A12 A23   A24 A15   A16 A26];
S5 = [S1 S2 S1];
sound(S5);

endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//4/4 SAD SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R5_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A25 A15 A16   A17 A18 A28   A29 A19 A18   A19 A10 A20];
S2 = [A20 A10 A19   A18 A19 A29   A28 A18 A17   A48];
S3 = [S1 S2 S1 S2];
sound(S3);
endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//6/4 SAD SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R6_callback(handles)
funcprot(0);
stacksize('max');

d1=0.5;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A25 A15 A16 A16 A17    A17 A18 A18 A19 A20   A28 A18 A18 A17 A16     A16 A17 A48];
S2 = [A28 A17 A17 A16 A15    A25 A16 A16 A17 A18   A28 A17 A17 A16 A15     A25 A46];
S3 = [S1 S2 S1 S2];
sound(S3);
endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//GUI FOR SELECTING SCALE OF ROMANTIC SONG
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function C3_callback(handles)
f=figure('figure_position',[400,50],'figure_size',[656,607],'auto_resize','on','background',[50],'figure_name','Scale Selection');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.R0=uicontrol(f,'unit','normalized','BackgroundColor',[0,0,0],'Enable','on','FontAngle','italic','FontName','algerian','FontSize',[30],'FontUnits','points','FontWeight','normal','ForegroundColor',[1,1,1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3278125,0.8130159,0.41,0.11],'Relief','raised','SliderStep',[0.01,0.1],'String','SELECT SCALE','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R0','Callback','R0_callback(handles)')
handles.R7=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.5530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','3/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R1','Callback','R7_callback(handles)')
handles.R8=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.4130159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','4/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R2','Callback','R8_callback(handles)')
handles.R9=uicontrol(f,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','italic','FontName','broadway','FontSize',[20],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3778125,0.2530159,0.3,0.1],'Relief','raised','SliderStep',[0.01,0.1],'String','6/4','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','R3','Callback','R9_callback(handles)')
endfunction



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//3/4 ROMANTIC SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R7_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1   = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A14 A25   A15 A26    A16 A27   A17 A28];
S2 = [A25 A15   A16 A17    A17 A16   A15 A14];
S3 = [A28 A17   A27 A16   A26 A15    A45];
S4 = [S1 S2 S3];

sound(S4);
endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//4/4 ROMANTIC SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R8_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);          A2 = noteG(2,n0,d2);          A3  = noteG(2,n0,d3);          A4  = noteG(2,n0,d4);           A5  = noteG(2,n0,d5);              A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);      A20 = noteG(2,n10,d2);      A30 = noteG(2,n10,d3);     A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);    A211 = noteG(2,n11,d2);    A311 = noteG(2,n11,d3);   A411 = noteG(2,n11,d4);       A511 = noteG(2,n11,d5);         A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);             B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);            B5  = noteG(3,n0,d5);              B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A12 A13 A25     A26 A17 A18   A18 A17 A26   A27 A18 A19];
S2 = [A20 A19 A28     A27 A16 A15   A26 A17 A18   A49];
S3 = [S1 S2 S1 S2];

sound(S3);
endfunction

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//6/4 ROMANTIC SONG FUNCTION
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function R9_callback(handles)
funcprot(0);
stacksize('max');

d1=0.4;//quarter
d2=2*d1; //half
d3=d1/2; //1/8
d4=4*d1; //full
d5=3*d1/2;//dotted minim
d6=d1/4;//semiquaver

inter=0*[0:1/22080:2*d1];
inter1=0*[0:1/22080:d1];

    n0=round(rand(0)*11);
    while(n0==1 | n0==3 | n0==6 | n0==8 | n0==10) n0=round(rand(0)*11),
    end;
    n1=round(rand(0)*11);
    while(n1==1 | n1==3 | n1==6 | n1==8 | n1==10) n1=round(rand(0)*11),
    end;
    n2=round(rand(0)*11);
    while(n2==1 | n2==3 | n2==6 | n2==8 | n2==10) n2=round(rand(0)*11),
    end;
    n3=round(rand(0)*11);
    while(n3==1 | n3==3 | n3==6 | n3==8 | n3==10) n3=round(rand(0)*11),
    end;
    n4=round(rand(0)*11);
    while(n4==1 | n4==3 | n4==6 | n4==8 | n4==10) n4=round(rand(0)*11),
    end;
    n5=round(rand(0)*11);
    while(n5==1 | n5==3 | n5==6 | n5==8 | n5==10) n5=round(rand(0)*11),
    end;
    n6=round(rand(0)*11);
    while(n6==1 | n6==3 | n6==6 | n6==8 | n6==10) n6=round(rand(0)*11),
    end;
    n7=round(rand(0)*11);
    while(n7==1 | n7==3 | n7==6 | n7==8 | n7==10) n7=round(rand(0)*11),
    end;
    n8=round(rand(0)*11);
    while(n8==1 | n8==3 | n8==6 | n8==8 | n8==10) n8=round(rand(0)*11),
    end;
    n9=round(rand(0)*11);
    while(n9==1 | n9==3 | n9==6 | n9==8 | n9==10) n9=round(rand(0)*11),
    end;
    n10=round(rand(0)*11);
    while(n10==1 | n10==3 | n10==6 | n10==8 | n10==10) n10=round(rand(0)*11),
    end;
    n11=round(rand(0)*11);
    while(n11==1 | n11==3 | n11==6 | n11==8 | n11==10) n11=round(rand(0)*11),
    end;
    
K1 = noteG(1,n0,d1); 
K2 = noteG(1,n0,d1);

A1 = noteG(2,n0,d1);         A2 = noteG(2,n0,d2);         A3  = noteG(2,n0,d3);        A4  = noteG(2,n0,d4);          A5  = noteG(2,n0,d5);             A6  = noteG(2,n0,d6);
A11 = noteG(2,n1,d1);        A21 = noteG(2,n1,d2);        A31 = noteG(2,n1,d3);        A41 = noteG(2,n1,d4);          A51 = noteG(2,n1,d5);             A61 = noteG(2,n1,d6);
A12 = noteG(2,n2,d1);        A22 = noteG(2,n2,d2);        A32 = noteG(2,n2,d3);        A42 = noteG(2,n2,d4);          A52 = noteG(2,n2,d5);             A62 = noteG(2,n2,d6);
A13 = noteG(2,n3,d1);        A23 = noteG(2,n3,d2);        A33 = noteG(2,n3,d3);        A43 = noteG(2,n3,d4);          A53 = noteG(2,n3,d5);             A63 = noteG(2,n3,d6);
A14 = noteG(2,n4,d1);        A24 = noteG(2,n4,d2);        A34 = noteG(2,n4,d3);        A44 = noteG(2,n4,d4);          A54 = noteG(2,n4,d5);             A64 = noteG(2,n4,d6);
A15 = noteG(2,n5,d1);        A25 = noteG(2,n5,d2);        A35 = noteG(2,n5,d3);        A45 = noteG(2,n5,d4);          A55 = noteG(2,n5,d5);             A65 = noteG(2,n5,d6);
A16 = noteG(2,n6,d1);        A26 = noteG(2,n6,d2);        A36 = noteG(2,n6,d3);        A46 = noteG(2,n6,d4);          A56 = noteG(2,n6,d5);             A66 = noteG(2,n6,d6);
A17 = noteG(2,n7,d1);        A27 = noteG(2,n7,d2);        A37 = noteG(2,n7,d3);        A47 = noteG(2,n7,d4);          A57 = noteG(2,n7,d5);             A67 = noteG(2,n7,d6);
A18 = noteG(2,n8,d1);        A28 = noteG(2,n8,d2);        A38 = noteG(2,n8,d3);        A48 = noteG(2,n8,d4);          A58 = noteG(2,n8,d5);             A68 = noteG(2,n8,d6);
A19 = noteG(2,n9,d1);        A29 = noteG(2,n9,d2);        A39 = noteG(2,n9,d3);        A49 = noteG(2,n9,d4);          A59 = noteG(2,n9,d5);             A69 = noteG(2,n9,d6);
A10 = noteG(2,n10,d1);       A20 = noteG(2,n10,d2);       A30 = noteG(2,n10,d3);       A40 = noteG(2,n10,d4);         A50 = noteG(2,n10,d5);            A60 = noteG(2,n10,d6);
A111 = noteG(2,n11,d1);      A211 = noteG(2,n11,d2);      A311 = noteG(2,n11,d3);      A411 = noteG(2,n11,d4);        A511 = noteG(2,n11,d5);           A611 = noteG(2,n11,d6);

B1 = noteG(3,n0,d1);         B2 = noteG(3,n0,d2);         B3  = noteG(3,n0,d3);        B4  = noteG(3,n0,d4);          B5  = noteG(3,n0,d5);             B6  = noteG(3,n0,d6);
B11 = noteG(3,n1,d1);        B21 = noteG(3,n1,d2);        B31 = noteG(3,n1,d3);        B41 = noteG(3,n1,d4);          B51 = noteG(3,n1,d5);             B61 = noteG(3,n1,d6);
B12 = noteG(3,n2,d1);        B22 = noteG(3,n2,d2);        B32 = noteG(3,n2,d3);        B42 = noteG(3,n2,d4);          B52 = noteG(3,n2,d5);             B62 = noteG(3,n2,d6);
B13 = noteG(3,n3,d1);        B23 = noteG(3,n3,d2);        B33 = noteG(3,n3,d3);        B43 = noteG(3,n3,d4);          B53 = noteG(3,n3,d5);             B63 = noteG(3,n3,d6);
B14 = noteG(3,n4,d1);        B24 = noteG(3,n4,d2);        B34 = noteG(3,n4,d3);        B44 = noteG(3,n4,d4);          B54 = noteG(3,n4,d5);             B64 = noteG(3,n4,d6);
B15 = noteG(3,n5,d1);        B25 = noteG(3,n5,d2);        B35 = noteG(3,n5,d3);        B45 = noteG(3,n5,d4);          B55 = noteG(3,n5,d5);             B65 = noteG(3,n5,d6);
B16 = noteG(3,n6,d1);        B26 = noteG(3,n6,d2);        B36 = noteG(3,n6,d3);        B46 = noteG(3,n6,d4);          B56 = noteG(3,n6,d5);             B66 = noteG(3,n6,d6);
B17 = noteG(3,n7,d1);        B27 = noteG(3,n7,d2);        B37 = noteG(3,n7,d3);        B47 = noteG(3,n7,d4);          B57 = noteG(3,n7,d5);             B67 = noteG(3,n7,d6);
B18 = noteG(3,n8,d1);        B28 = noteG(3,n8,d2);        B38 = noteG(3,n8,d3);        B48 = noteG(3,n8,d4);          B58 = noteG(3,n8,d5);             B68 = noteG(3,n8,d6);
B19 = noteG(3,n9,d1);        B29 = noteG(3,n9,d2);        B39 = noteG(3,n9,d3);        B49 = noteG(3,n9,d4);          B59 = noteG(3,n9,d5);             B69 = noteG(3,n9,d6);
B10 = noteG(3,n10,d1);       B20 = noteG(3,n10,d2);       B30 = noteG(3,n10,d3);       B40 = noteG(3,n10,d4);         B50 = noteG(3,n10,d5);            B60 = noteG(3,n10,d6);
B111 = noteG(3,n11,d1);      B211 = noteG(3,n11,d2);      B311 = noteG(3,n11,d3);      B411 = noteG(3,n11,d4);        B511 = noteG(3,n11,d5);           B611 = noteG(3,n11,d6);

S1 = [A21 A12 A13 A26   A27 A16 A17 A28    A26 A15 A14 A25    A26 A13 A12 A21];
S2 = [A12 A13 A13 A14 A27    A26 A17 A18 A19 A19    A12 A12 A13 A14 A27   A47];
S3 = [S1 S2 S1 S2];
sound(S3);
endfunction



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//THE END
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
