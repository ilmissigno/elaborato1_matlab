function plot_interpolation
    x = []; y = []; t = []; p1 = []; p2 = []; p3 = [];
    n = 0;
    button = 1;
    hold on
    axis tight; thisax=axis;
    % Create a figure and axes
    f = figure('Visible','off');
    ax = axes('Units','pixels');
    hold on

    popup = uicontrol('Style', 'popup',...
           'String', {'Lineare','Polinomio','Spline naturale','Tutte'},...
           'Position', [300 365 100 50],...
           'Callback', @interpolate);    
    

    btn = uicontrol('Style', 'pushbutton', 'String', 'Close',...
        'Position', [455 395 50 20],...
        'Callback', 'delete(gcf)');   
    

    takeIn = uicontrol('Style', 'pushbutton', 'String', 'Seleziona punti',...
        'Position', [75 395 120 20],...
        'Callback', @takeInputs);  

					
    % Add a text uicontrol to label the slider.
    txt = uicontrol('Style','text',...
        'Position',[195 390 100 28],...
        'String','Seleziona il tipo di interpolazione');
    
    % Make figure visble after adding all components
    f.Visible = 'on';
    % This code uses dot notation to set properties. 
    % Dot notation runs in R2014b and later.
    % For R2014a and earlier: set(f,'Visible','on');
    
    function interpolate(source,event)
        idx = source.Value;
        maps = source.String;
        disp(maps);
        switch idx
              case 1
                  set(p1,'Visible','on');
                  set(p2,'Visible','off');
                  set(p3,'Visible','off');
                  pt = interp1(x,y,t);
                  p1 = plot(t,pt,'r-','LineWidth',2);
              case 2
                  set(p1,'Visible','off');
                  set(p2,'Visible','on');
                  set(p3,'Visible','off');
                  pt = polyval(polyfit(x,y,length(x)-1),t);
                  p2 = plot(t,pt,'g-','LineWidth',2);
              case 3
                  set(p1,'Visible','off');
                  set(p2,'Visible','off');
                  set(p3,'Visible','on');
                  s = ppval(csape(x,y,'second'),t);
                  p3 = plot(t,s,'b-','LineWidth',2);
              case 4
                  set(p1,'Visible','on');
                  set(p2,'Visible','on');
                  set(p3,'Visible','on');
                  pt = interp1(x,y,t);
                  p1 = plot(t,pt,'r-','LineWidth',2);
                  pt = polyval(polyfit(x,y,length(x)-1),t);
                  p2 = plot(t,pt,'g-','LineWidth',2);
                  s = ppval(csape(x,y,'second'),t);
                  p3 = plot(t,s,'b-','LineWidth',2);
         end
    end

    function takeInputs(source,event)
        while button == 1
            [xi,yi,button] = ginput(1);
            plot(xi,yi,'bo','MarkerFaceColor','g','MarkerSize',8);
            axis(thisax);
            n=n+1;
            x = [x xi]; y = [y yi];
        end
        t = linspace(x(1),x(length(x)));
    end
end