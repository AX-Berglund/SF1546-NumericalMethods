function [sol_h, sol_h2, sol_h4, time_h, time_h2, time_h4, error_summary] = RocketMan(t_start, t_burnout, t_end, step_size, force, initial_speed, eval_component, launch_angle)
    % Parametrar
    launch_angle = deg2rad(81);  % konvertera till radianer
    start_x = 0;
    start_y = 0;
    subdivisions = [1, 2, 4];
    
    [vx_init, vy_init] = velocity(initial_speed, launch_angle); % Initiala hastighetskomponenter

    % === Del 1: Förbränningsfasen (t_start till t_burnout) ===
    for i = 1:3
        current_step = step_size / subdivisions(i);
        step_sizes(i) = current_step;

        [solution_burn, time_burn] = RungeKutta(t_start, t_burnout, 0, current_step, force, ...
                                                start_x, start_y, vx_init, vy_init, launch_angle);
        burn_solutions{i} = solution_burn;
        burn_times{i} = time_burn;
    end

    [burn_error, burn_order] = error_calc(burn_solutions, eval_component);
    
    % Använder lösningen med minsta steglängden som initialvärde för nästa fas
    final_burn_state = burn_solutions{3};

    % === Del 2: Fritt fall (t_burnout till t_end) ===
    for j = 1:3
        current_step = step_size / subdivisions(j);

        [solution_fall, time_fall] = RungeKutta(t_burnout, t_end, 0, current_step, 0, ...
                                                final_burn_state(1,end), final_burn_state(2,end), ...
                                                final_burn_state(3,end), final_burn_state(4,end), launch_angle);
        fall_solutions{j} = solution_fall;
        fall_times{j} = time_fall;
    end

    [fall_error, fall_order] = error_calc(fall_solutions, eval_component);
    
    % === Sammanslagning av lösningar för varje steglängd ===
    sol_h  = [burn_solutions{1}, fall_solutions{1}(:,2:end)];
    sol_h2 = [burn_solutions{2}, fall_solutions{2}(:,2:end)];
    sol_h4 = [burn_solutions{3}, fall_solutions{3}(:,2:end)];

    time_h  = [burn_times{1}, fall_times{1}(2:end)];
    time_h2 = [burn_times{2}, fall_times{2}(2:end)];
    time_h4 = [burn_times{3}, fall_times{3}(2:end)];

    % === Feluppskattning och ordningsberäkning ===
    error_summary = [step_sizes', burn_error, fall_error, [0; burn_order; fall_order]];
end
