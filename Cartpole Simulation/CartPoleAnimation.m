function CartPoleAnimation(states, time)
    states = states';
    time = time';
    
    xs = states(1, :);
    thetas = states(2, :);
    
    % initialize position and angle
    x = xs(1);
    theta = thetas(1);

    figure('Name', 'Cart-Pole Animation', 'NumberTitle', 'off')
    set(gcf,'Position',[200 200 800 1000])
    
    subplot(5, 1, 1)
    % cart
    cart = rectangle('Position',[x-0.25 0.05 0.5, 0.3], 'Curvature', 0.2, 'EdgeColor', 'k', 'FaceColor', [0, 0.5, 0.5], 'Linewidth', 3);
    % left wheel
    l_wheel = rectangle('Position', [x-0.2, 0, 0.1, 0.1], 'Curvature',[1 1], 'EdgeColor', 'k', 'FaceColor', 'k');
    % right wheel
    r_wheel = rectangle('Position', [x+0.1, 0, 0.1, 0.1], 'Curvature',[1 1], 'EdgeColor', 'k', 'FaceColor', 'k');
    % pole
    pole = line([x, x + 1 * cos(theta-pi/2)], [0.175, 0.175 + 1 * sin(theta-pi/2)], 'Linewidth', 5, 'color', 'k');
    
    axis equal
    grid on
    grid minor
    xlim([-3, 3])
    ylim([0, 1.5])
    
    subplot(5, 1, 2)
    position = line(time(1), xs(1), 'Linewidth', 2, 'color', 'blue');
    xlabel("Time [sec]")
    ylabel("Cart Position [m]")
    
    grid on
    grid minor
    xlim([0, time(end)])
    ylim([min(xs), max(xs)])
    
    subplot(5, 1, 3)
    angle = line(time(1), thetas(1), 'Linewidth', 2, 'color', 'blue');
    xlabel("Time [sec]")
    ylabel("Pole Angle [rad]")
    
    grid on
    grid minor
    xlim([0, time(end)])
    ylim([min(thetas), max(thetas)])
    
    subplot(5, 1, 4)
    linvel = line(time(1), states(3, 1), 'Linewidth', 2, 'color', 'blue');
    xlabel("Time [sec]")
    ylabel("Cart Velocity [m/s]")
    
    grid on
    grid minor
    xlim([0, time(end)])
    ylim([min(states(3, :)), max(states(3, :))])
    
    subplot(5, 1, 5)
    angvel = line(time(1), states(4, 1), 'Linewidth', 2, 'color', 'blue');
    xlabel("Time [sec]")
    ylabel("Pole Angular Velocity [rad/s]")
    
    grid on
    grid minor
    xlim([0, time(end)])
    ylim([min(states(4, :)), max(states(4, :))])
    
    % plot settings
    

    for j = 1 : max(size(xs))
        x = xs(j);
        theta = thetas(j);
        
        % update plot
        cart.Position = [x-0.25 0.05 0.5, 0.3];
        l_wheel.Position = [x-0.2, 0, 0.1, 0.1];
        r_wheel.Position = [x+0.1, 0, 0.1, 0.1];
        pole.XData = [x, x + 1 * cos(theta-pi/2)];
        pole.YData = [0.175, 0.175 + 1 * sin(theta-pi/2)];
        
        position.XData = time(1:j);
        position.YData = xs(1:j);
        
        angle.XData = time(1:j);
        angle.YData = thetas(1:j);
        
        linvel.XData = time(1:j);
        linvel.YData = states(3, 1:j);
        
        angvel.XData = time(1:j);
        angvel.YData = states(4, 1:j);
        
        if mod(j, 10) == 0
            drawnow
        end
    end
    
    saveas(gcf, 'cartpole.png')
end
