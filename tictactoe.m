function tictactoe()


global f playerWon turn trexwon pandawon ties Trexfil Pandafil tiewon TrexScore PandaScore
global tiefil mode ComputerModebutton  computerTurn difficulty player1EditText player2EditText
global TieScore gameName

currentTime=datetime('now');
gameName=strcat('Tic-Tac-Toe',':',datestr(currentTime));


TrexScore=0;
PandaScore=0;
TieScore=0;


playerWon=false;
turn = 0;
trexwon=0;
pandawon=0;
tiewon=0;
computerTurn=false;



%%create figure 
f = figure('Name','Tic-Tac-Toe','Units','inches',...
    'Position',[2,2,10,4],'color','black');
f.Name=gameName;

modeText=uicontrol(f,'Style','text','Units','inches',...
    'Position',[7.24,3.47,1.8,0.2],'FontSize',10);
set(modeText,'String','Mode')


mode=uicontrol(f,'Style','popupmenu','Units','inches',...
    'Position',[7.24,2.47,1.8,1],'FontSize',10);
mode.String={'Player Vs Computer','Player Vs Player','Computer Vs Computer'};

difficulty=uicontrol(f,'Style','popupmenu','Units','inches',...
    'Position',[9,2.47,1,1],'FontSize',10);
difficulty.String={'Easy','Medium','Hard'};

modedifficulty=uicontrol(f,'Style','text','Units','inches',...
    'Position',[9,3.47,1,0.2],'FontSize',10);
set(modedifficulty,'String','Difficulty')


player1Text=uicontrol(f,'Style','text','Units','inches',...
    'Position',[7.8,2.5,1,0.2],'FontSize',10);
set(player1Text,'String','Player1(panda)')

player1EditText=uicontrol(f,'Style','edit','Units','inches',...
    'Position',[8.8,2.5,1,0.2],'FontSize',10);

player2Text=uicontrol(f,'Style','text','Units','inches',...
    'Position',[7.8,2.2,1,0.2],'FontSize',10);
set(player2Text,'String','Player2 (Trex)')

player2EditText=uicontrol(f,'Style','edit','Units','inches',...
    'Position',[8.8,2.2,1,0.2],'FontSize',10);

Save = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[9,1.95,1,0.2],'FontSize',12,'callback',@save_callback);
set(Save,'String','Save')


%%add buttons
global b1 b2 b3 b4 b5 b6 b7 b8 b9
b1 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[0.2,2.5,1,1],'FontSize',36,'Callback',@onPush);
b2 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[1.22,2.5,1,1],'FontSize',36,'Callback',@onPush);
b3 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[2.24,2.5,1,1],'FontSize',36,'Callback',@onPush);
b4 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[0.2,1.47,1,1],'FontSize',36,'Callback',@onPush);
b5 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[1.22,1.47,1,1],'FontSize',36,'Callback',@onPush);
b6 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[2.24,1.47,1,1],'FontSize',36,'Callback',@onPush);
b7 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[0.2,0.47,1,1],'FontSize',36,'Callback',@onPush);
b8 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[1.22,0.47,1,1],'FontSize',36,'Callback',@onPush);
b9 = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[2.24,0.47,1,1],'FontSize',36,'Callback',@onPush);

Trextext = uicontrol(f,'Style','text','Units','inches',...
    'Position',[5.24,3.2,0.5,0.2],'FontSize',10);
set(Trextext,'String','Trex')


Trexfil = uicontrol(f,'Style','text','Units','inches',...
    'Position',[5.24,2.98,0.5,0.2],'FontSize',10);
set(Trexfil,'String',trexwon)

Tietext = uicontrol(f,'Style','text','Units','inches',...
    'Position',[5.8,3.2,0.5,0.2],'FontSize',10);
set(Tietext,'String','Tie')

tiefil = uicontrol(f,'Style','text','Units','inches',...
    'Position',[5.8,2.98,0.5,0.2],'FontSize',10);
set(tiefil,'String',tiewon)


Pandatext = uicontrol(f,'Style','text','Units','inches',...
    'Position',[6.36,3.2,0.5,0.2],'FontSize',10);
set(Pandatext,'String','Panda')
Pandafil = uicontrol(f,'Style','text','Units','inches',...
    'Position',[6.36,2.98,0.5,0.2],'FontSize',10);
set(Pandafil,'String',pandawon)


NewGame = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[5.24,0.47,1,0.5],'FontSize',10,'Callback',@newgame_Callback);
set(NewGame,'String','New Game')

Quit = uicontrol(f,'Style','pushbutton','Units','inches',...
    'Position',[6.34,0.47,1,0.5],'FontSize',10,'Callback',@quit_Callback);
set(Quit,'String','Quit')


ComputerModebutton= uicontrol(f,'Style','Togglebutton','Units','inches',...
      'Position',[3.8,0.47,1.3,0.5],'FontSize',10,'callback',@computerplayer);
set(ComputerModebutton,'String','Computer Mode')
 
 
end


function onPush(buttonClick,eventdata)


global playerWon turn computerTurn f gameName

trex=imresize(imread('trex.png'),[64,64]);
panda=imresize(imread('panda.png'),[64,64]);

imageData=get(buttonClick,'CData');
if playerWon || ~strcmp(gameName,f.Name)
  
else    
    if sum(imageData(:)) == sum(panda(:))   
        return
    elseif sum(imageData(:)) == sum(trex(:))
        return
        
    elseif  turn == 0
    %panda
        set(buttonClick,'CData',panda);
        turn = 1;
    else
    %trex
        set(buttonClick,'CData',trex);
        turn = 0;
    end
    
    checkForWin()
end

end


function checkForWin()
%get buttons
global b1 b2 b3 b4 b5 b6 b7 b8 b9 tiefil playerWon tiewon computerTurn mode

b1d=get(b1,'CData');b1data=sum(b1d(:));
b2d=get(b2,'CData');b2data=sum(b2d(:));
b3d=get(b3,'CData');b3data=sum(b3d(:));
b4d=get(b4,'CData');b4data=sum(b4d(:));
b5d=get(b5,'CData');b5data=sum(b5d(:));
b6d=get(b6,'CData');b6data=sum(b6d(:));
b7d=get(b7,'CData');b7data=sum(b7d(:));
b8d=get(b8,'CData');b8data=sum(b8d(:));
b9d=get(b9,'CData');b9data=sum(b9d(:));


%check winning conditions
if (b1data == b2data) + (b2data== b3data) ==2
    buttondata=sum(b1data(:)) + sum(b2data(:)) + sum(b3data(:));
    win(buttondata)

elseif (b4data == b5data) + (b5data== b6data) ==2
    buttondata=sum(b4data(:)) + sum(b5data(:)) + sum(b6data(:));
    win(buttondata)
    
elseif (b7data == b8data) + (b8data == b9data)==2
     buttondata=sum(b7data(:)) + sum(b8data(:)) + sum(b9data(:));
    win(buttondata)
    
elseif (b1data == b4data)+ (b4data == b7data)==2
    buttondata=sum(b1data(:)) + sum(b4data(:)) + sum(b7data(:));
    win(buttondata)
    
elseif (b2data == b5data) + (b5data == b8data)==2
    buttondata=sum(b2data(:)) + sum(b5data(:)) + sum(b8data(:));
    win(buttondata)
    
elseif (b3data == b6data) + (b6data == b9data)==2
    buttondata=sum(b3data(:)) + sum(b6data(:)) + sum(b9data(:));
    win(buttondata)
    
elseif (b1data == b5data) + (b5data == b9data)==2
    buttondata=sum(b1data(:)) + sum(b5data(:)) + sum(b9data(:));
    win(buttondata)
    
elseif (b3data == b5data) + (b3data == b7data)==2
    buttondata=sum(b3data(:)) + sum(b5data(:)) + sum(b7data(:));
    win(buttondata)
elseif (~isempty(b1d)&& ~isempty(b2d)&& ~isempty(b3d) && ~isempty(b4d)&&...
        ~isempty(b5d)&& ~isempty(b6d)&& ~isempty(b7d) && ~isempty(b8d) && ~isempty(b9d))...
        + playerWon==1  
         tiewon=tiewon+1;
         set(tiefil,'String',tiewon)
         pause(0.5)
         clearBoard()
         if ~computerTurn && mode.Value==1
             computerTurn=true;
         end
         
end


end


function win(data)

global playerWon Trexfil Pandafil trexwon pandawon mode computerTurn

trex=imresize(imread('trex.png'),[64,64]);
panda=imresize(imread('panda.png'),[64,64]);

if sum(data(:))==3*sum(trex(:))
   trexwon=trexwon+1; 
   playerWon=true;
   set(Trexfil,'String',trexwon)
   pause(2)
   clearBoard();
   
   
   if  mode~=2 && ~computerTurn
           computerTurn=true;
   elseif mode~=2 && computerTurn
       computerTurn=false; 
   end
  
   
elseif sum(data(:))==3*sum(panda(:))
   pandawon=pandawon+1;
   set(Pandafil,'String',pandawon)
   playerWon=true;  
   pause(2)
   clearBoard();
   
   
end

pause(1)
end


function newgame_Callback(buttonClick,eventdata)
global  playerWon trexwon tiewon pandawon Trexfil Pandafil tiefil
global b1 b2 b3 b4 b5 b6 b7 b8 b9 turn

playerWon=false;
turn = 0;
%clear button
set(b1,'CData',[]);
set(b2,'CData',[]);
set(b3,'CData',[]);
set(b4,'CData',[]);
set(b5,'CData',[]);
set(b6,'CData',[]);
set(b7,'CData',[]);
set(b8,'CData',[]);
set(b9,'CData',[]);

trexwon=0;
pandawon=0;
tiewon=0;

set(Trexfil,'String',trexwon)
set(Pandafil,'String',pandawon)
set(tiefil,'String',tiewon)

end



function quit_Callback(buttonClick,eventdata)
close all

end

function playerComp()
    
global f ComputerModebutton playerWon  b1 b2 b3 b4 b5 b6 b7 b8 b9 computerTurn


ComputerMode=ComputerModebutton.Value;
computerTurn=true;

emptybutton=9;

while ~playerWon && ComputerMode
    
      
     
   
  if computerTurn  
    b1d=get(b1,'CData');
    b2d=get(b2,'CData');
    b3d=get(b3,'CData');
    b4d=get(b4,'CData');
    b5d=get(b5,'CData');
    b6d=get(b6,'CData');
    b7d=get(b7,'CData');
    b8d=get(b8,'CData');
    b9d=get(b9,'CData');

 newbuttonempty=isempty(b1d)+ isempty(b2d) + isempty(b3d) + isempty(b4d)+...
        isempty(b5d)+ isempty(b6d) + isempty(b7d) + isempty(b8d) + isempty(b9d);  
     
        if  newbuttonempty==0
               emptybutton=9; 
        end
        
        computerMode()
        computerTurn=false;
        emptybutton=emptybutton-1;
              
 
  else
      
     
  while  true
    
    if computerTurn 
        break
    end      
    waitforbuttonpress;
    b1d=get(b1,'CData');
    b2d=get(b2,'CData');
    b3d=get(b3,'CData');
    b4d=get(b4,'CData');
    b5d=get(b5,'CData');
    b6d=get(b6,'CData');
    b7d=get(b7,'CData');
    b8d=get(b8,'CData');
    b9d=get(b9,'CData');

 newbuttonempty=isempty(b1d)+ isempty(b2d) + isempty(b3d) + isempty(b4d)+...
        isempty(b5d)+ isempty(b6d) + isempty(b7d) + isempty(b8d) + isempty(b9d);        
      
             if  newbuttonempty==9
                    emptybutton=9; 
             end
                     
        if newbuttonempty==emptybutton-1                        
             computerTurn=true;  
             emptybutton=emptybutton-1;
             
            break
        end
        
        
  end
       
  end
   
   if playerWon
       pause(0.5) 
       clearBoard()
       emptybutton=9;
       playerWon=false;
   end
pause(0.1)
  
    
   
  end


end


function computerplayer(buttonClick,eventdata)

  global ComputerMode playerWon ComputerModebutton mode
  
  ComputerMode=ComputerModebutton.Value;
 
  if ComputerMode==1
       ComputerModebutton.BackgroundColor=[1 0 0];
  else
      ComputerModebutton.BackgroundColor=[ 0.9400 0.9400 0.9400];
  end
      
  
  if mode.Value==1
      playerComp()
      
  elseif mode.Value==2
      
  else
      
  while ~playerWon && ComputerMode
   
    computerMode()
    pause(0.05)
    
    if playerWon
       pause(0.5) 
       clearBoard()
    end
 
    
  end
  
  end

end


function computerMode()

%check cell empty
global b1 b2 b3 b4 b5 b6 b7 b8 b9 difficulty

diff=difficulty.Value;

b1d=get(b1,'CData');b1data=sum(b1d(:));
b2d=get(b2,'CData');b2data=sum(b2d(:));
b3d=get(b3,'CData');b3data=sum(b3d(:));
b4d=get(b4,'CData');b4data=sum(b4d(:));
b5d=get(b5,'CData');b5data=sum(b5d(:));
b6d=get(b6,'CData');b6data=sum(b6d(:));
b7d=get(b7,'CData');b7data=sum(b7d(:));
b8d=get(b8,'CData');b8data=sum(b8d(:));
b9d=get(b9,'CData');b9data=sum(b9d(:));

panda=imresize(imread('panda.png'),[64,64]);
compdata=sum(panda(:));
Listempty=[];
if isempty(b1d)  Listempty=[Listempty 1];end
if isempty(b2d)  Listempty=[Listempty 2];end
if isempty(b3d)  Listempty=[Listempty 3];end
if isempty(b4d)  Listempty=[Listempty 4];end
if isempty(b5d)  Listempty=[Listempty 5];end
if isempty(b6d)  Listempty=[Listempty 6];end
if isempty(b7d)  Listempty=[Listempty 7];end
if isempty(b8d)  Listempty=[Listempty 8];end
if isempty(b9d)  Listempty=[Listempty 9];end
      

if isempty(Listempty)
    pause(0.5)
    clearBoard();   

else

if diff==1    
    buttonpress=datasample(Listempty,1);

    if buttonpress==1  onPush(b1);end
    if buttonpress==2  onPush(b2);end
    if buttonpress==3  onPush(b3);end
    if buttonpress==4  onPush(b4);end
    if buttonpress==5  onPush(b5);end
    if buttonpress==6  onPush(b6);end
    if buttonpress==7  onPush(b7);end
    if buttonpress==8  onPush(b8);end
    if buttonpress==9  onPush(b9);end

elseif  diff==2
    
    buttonpress=datasample(Listempty,1);
       
    if b1data==compdata && b2data==compdata && isempty(b3d)
         onPush(b3);
    elseif b1data==compdata && b4data==compdata && isempty(b7d)
        onPush(b7);
    elseif b1data==compdata && b5data==compdata && isempty(b9d)
        onPush(b9);    
    elseif b4data==compdata && b5data==compdata && isempty(b6d)
        onPush(b6);    
    elseif b7data==compdata && b8data==compdata && isempty(b9d)
        onPush(b9);  
    elseif b7data==compdata && b5data==compdata && isempty(b3d)
        onPush(b3);    
    elseif b2data==compdata && b5data==compdata && isempty(b8d)
        onPush(b8);  
    elseif b3data==compdata && b6data==compdata && isempty(b9d)
        onPush(b9);  
    elseif b8data==compdata && b5data==compdata && isempty(b2d)
        onPush(b2);   
   elseif b9data==compdata && b5data==compdata && isempty(b1d)
        onPush(b1); 
   elseif b1data==compdata && b9data==compdata && isempty(b5d)
        onPush(b5);    
   elseif b3data==compdata && b7data==compdata && isempty(b5d)
        onPush(b5);  
   elseif b1data==compdata && b3data==compdata && isempty(b2d)
        onPush(b2);
   elseif b4data==compdata && b6data==compdata && isempty(b5d)
        onPush(b5);
   elseif b7data==compdata && b9data==compdata && isempty(b8d)
        onPush(b8);
   elseif b1data==compdata && b7data==compdata && isempty(b4d)
        onPush(b4);     
   elseif b2data==compdata && b8data==compdata && isempty(b5d)
        onPush(b5);
   elseif b3data==compdata && b9data==compdata && isempty(b6d)
        onPush(b6);     
        
    else
        
    buttonpress=datasample(Listempty,1);

    if buttonpress==1  onPush(b1);end
    if buttonpress==2  onPush(b2);end
    if buttonpress==3  onPush(b3);end
    if buttonpress==4  onPush(b4);end
    if buttonpress==5  onPush(b5);end
    if buttonpress==6  onPush(b6);end
    if buttonpress==7  onPush(b7);end
    if buttonpress==8  onPush(b8);end
    if buttonpress==9  onPush(b9);end
    
    end  
else
     buttonpress=datasample(Listempty,1);
       
    if b1data==compdata && b2data==compdata && isempty(b3d)
         onPush(b3);
    elseif b1data==compdata && b4data==compdata && isempty(b7d)
        onPush(b7);
    elseif b1data==compdata && b5data==compdata && isempty(b9d)
        onPush(b9);    
    elseif b4data==compdata && b5data==compdata && isempty(b6d)
        onPush(b6);    
    elseif b7data==compdata && b8data==compdata && isempty(b9d)
        onPush(b9);  
    elseif b7data==compdata && b5data==compdata && isempty(b3d)
        onPush(b3);    
    elseif b2data==compdata && b5data==compdata && isempty(b8d)
        onPush(b8);  
    elseif b3data==compdata && b6data==compdata && isempty(b9d)
        onPush(b9);  
    elseif b8data==compdata && b5data==compdata && isempty(b2d)
        onPush(b2);   
   elseif b9data==compdata && b5data==compdata && isempty(b1d)
        onPush(b1); 
   elseif b1data==compdata && b9data==compdata && isempty(b5d)
        onPush(b5);    
   elseif b3data==compdata && b7data==compdata && isempty(b5d)
        onPush(b5);  
   elseif b1data==compdata && b3data==compdata && isempty(b2d)
        onPush(b2);
   elseif b4data==compdata && b6data==compdata && isempty(b5d)
        onPush(b5);
   elseif b7data==compdata && b9data==compdata && isempty(b8d)
        onPush(b8);
   elseif b1data==compdata && b7data==compdata && isempty(b4d)
        onPush(b4);     
   elseif b2data==compdata && b8data==compdata && isempty(b5d)
        onPush(b5);
   elseif b3data==compdata && b9data==compdata && isempty(b6d)
        onPush(b6); 
        %blocking
   elseif b1data~=compdata && b2data~=compdata && ~isempty(b1d) && ~isempty(b2d) && isempty(b3d)
        onPush(b3); 
   elseif b4data~=compdata && b5data~=compdata && ~isempty(b4d) && ~isempty(b5d) && isempty(b6d)
        onPush(b6);  
   elseif b7data~=compdata && b8data~=compdata && ~isempty(b7d) && ~isempty(b8d)  && isempty(b9d)
        onPush(b9);
   elseif b1data~=compdata && b4data~=compdata && ~isempty(b1d) && ~isempty(b4d)  && isempty(b7d)
        onPush(b7);
   elseif b2data~=compdata && b5data~=compdata && ~isempty(b2d) && ~isempty(b5d)  &&  isempty(b8d)
        onPush(b8);    
   elseif b3data~=compdata && b6data~=compdata && ~isempty(b3d) && ~isempty(b6d)  &&  isempty(b9d)
        onPush(b9);
   elseif b1data~=compdata && b3data~=compdata && ~isempty(b1d) && ~isempty(b3d)  &&  isempty(b2d)
        onPush(b2);
   elseif b4data~=compdata && b6data~=compdata && ~isempty(b4d) && ~isempty(b6d) &&   isempty(b5d)
        onPush(b5); 
   elseif b7data~=compdata && b9data~=compdata && ~isempty(b7d) && ~isempty(b9d) &&   isempty(b8d)
        onPush(b8);    
    elseif b1data~=compdata && b7data~=compdata && ~isempty(b1d) && ~isempty(b7d) &&  isempty(b4d)
        onPush(b4);    
    elseif b2data~=compdata && b8data~=compdata && ~isempty(b2d) && ~isempty(b8d) &&  isempty(b5d)
        onPush(b5);    
    elseif b3data~=compdata && b9data~=compdata && ~isempty(b3d) && ~isempty(b9d) &&  isempty(b6d)
        onPush(b6);   
    elseif b2data~=compdata && b3data~=compdata && ~isempty(b2d) && ~isempty(b3d) &&  isempty(b1d)
        onPush(b1);    
    elseif b5data~=compdata && b6data~=compdata && ~isempty(b5d) && ~isempty(b6d) &&  isempty(b4d)
        onPush(b4);    
    elseif b8data~=compdata && b9data~=compdata && ~isempty(b8d) && ~isempty(b9d) &&  isempty(b7d)
        onPush(b7);   
    elseif b1data~=compdata && b9data~=compdata && ~isempty(b1d) && ~isempty(b9d)  &&  isempty(b5d)
        onPush(b5);
    elseif b3data~=compdata && b7data~=compdata && ~isempty(b3d) && ~isempty(b7d) &&   isempty(b5d)
        onPush(b5);   
    elseif b9data~=compdata && b5data~=compdata && ~isempty(b9d) && ~isempty(b5d) &&   isempty(b1d)
        onPush(b1);
   elseif b7data~=compdata && b5data~=compdata && ~isempty(b7d) && ~isempty(b5d) &&   isempty(b1d)
        onPush(b1);     
   elseif b3data~=compdata && b5data~=compdata && ~isempty(b3d) && ~isempty(b5d) &&   isempty(b7d)
        onPush(b7);  
   elseif b7data~=compdata && b4data~=compdata && ~isempty(b7d) && ~isempty(b4d) &&   isempty(b1d)
        onPush(b1);  
   elseif b9data~=compdata && b6data~=compdata && ~isempty(b9d) && ~isempty(b6d) &&   isempty(b3d)
        onPush(b3);       
    else
        
        
    buttonpress=datasample(Listempty,1);

    if buttonpress==1  onPush(b1);end
    if buttonpress==2  onPush(b2);end
    if buttonpress==3  onPush(b3);end
    if buttonpress==4  onPush(b4);end
    if buttonpress==5  onPush(b5);end
    if buttonpress==6  onPush(b6);end
    if buttonpress==7  onPush(b7);end
    if buttonpress==8  onPush(b8);end
    if buttonpress==9  onPush(b9);end
    
    end  
    
end

end
end


function save_callback(buttonClick,eventdata)
global player1EditText player2EditText PandaScore TrexScore TieScore trexwon pandawon tiewon

Text1=get(player1EditText,'String');

Text2=get(player2EditText,'String');
player1Name=Text1;
player2Name=Text2;

  TrexScore = trexwon;
  PandaScore =pandawon;
  TieScore= tiewon;
  
try
    load('scoreHistory.mat')
    
    [L,~]=size(T);
    name1=T.player1Name;
    name2=T.player2Name;
    for i=1:L
        if L==1
        p1{i}=name1;
        p2{i}=name2;
        else
        p1{i}=name1{i};
        p2{i}=name2{i};
        end
    end
    
    p1{L+1}=player1Name;
    p2{L+1}=player2Name;
    
    player1Name=p1'; player2Name=p2';
    
    player_1=[T.player_1;TrexScore];
    Ties=[T.Ties;TieScore];
    player_2=[T.player_2;PandaScore];
    date_time=[T.date_time;datetime('now')];
    
    var={'date_time','player1Name','player2Name','player_1','Ties','player_2'};   
    T = table(date_time,player1Name,player2Name,player_1,Ties,player_2,'VariableNames',var)
   
    save('scoreHistory.mat','T')
    msgbox('success')
catch
 
    player_1=TrexScore;
    Tie=TieScore;
    player_2=PandaScore;
    date_time=datetime('now');
    player1Name=Text1;
    player2Name=Text2;

    var={'date_time','player1Name','player2Name','player_1','Ties','player_2'};   
    T = table(date_time,player1Name,player2Name,player_1,Tie,player_2,'VariableNames',var)
    
    save('scoreHistory.mat','T')
    
end

end


function clearBoard()
global  playerWon 
global b1 b2 b3 b4 b5 b6 b7 b8 b9

playerWon=false;

%clear button
set(b1,'CData',[]);
set(b2,'CData',[]);
set(b3,'CData',[]);
set(b4,'CData',[]);
set(b5,'CData',[]);
set(b6,'CData',[]);
set(b7,'CData',[]);
set(b8,'CData',[]);
set(b9,'CData',[]);


end