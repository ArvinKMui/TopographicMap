function [topograph, lowHighDist] = TopographMap (altitude, water)

    %Initializing Variables
    [length, width] = size(water);
    topograph = uint8(zeros(length, width, 3));

    %Initilaizing HighCord and LowCord with non-water value
    for i = 1:1:length
        for j = 1:1:width
            if(water(i, j) == 0)
                highCords = [i j];
                lowCords = [i j];
                break;
            end
        end
    end

    %Traversing through array to set colors initially
    for i = 1:1:length
        for j = 1:1:widthS
            if(water(i,j) == 1)
                topograph(i, j, 3) = 255;

            elseif(altitude(i, j) <= 0)
                %Remains black
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            elseif(altitude(i, j) <= 1000)
                topograph(i, j, 2) = 255;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            elseif(altitude(i, j) <= 2000)
                topograph(i, j, 1) = 255;
                topograph(i, j, 2) = 255;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            elseif(altitude(i, j) <= 3000)
                topograph(i, j, 1) = 255;
                topograph(i, j, 2) = 128;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            elseif(altitude(i, j) <= 4000)
                topograph(i, j, 1) = 255;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            elseif(altitude(i, j) <= 4500)
                topograph(i, j, 1) = 255;
                topograph(i, j, 2) = 255;
                topograph(i, j, 3) = 255;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end

            else
                topograph(i, j, 2) = 255;
                topograph(i, j, 3) = 255;
                if(altitude(i, j) > altitude(highCords(1), highCords(2)))
                    highCords = [i j];
                end

                if(altitude(i, j) < altitude(lowCords(1), lowCords(2)))
                    lowCords = [i j];
                end
            end
        end
    end

    %Setting color for low and high point
    topograph(highCords(1), highCords(2), 1) = 255;
    topograph(highCords(1), highCords(2), 2) = 0;
    topograph(highCords(1), highCords(2), 3) = 255;

    topograph(lowCords(1), lowCords(2), 1) = 128;
    topograph(lowCords(1), lowCords(2), 2) = 0;
    topograph(lowCords(1), lowCords(2), 3) = 255;
    

    lowHighDist = sqrt((10*highCords(1) - 10*lowCords(1))^2 + (10*highCords(2) - 10*lowCords(2))^2);
end