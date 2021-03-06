function val = MSE(imgReference, imgDistorted)
%
%
%      val = MSE(imgReference, imgDistorted)
%
%
%       Input:
%           -imgReference: input reference image
%           -imgDistorted: input distorted image
%
%       Output:
%           -val: the Mean Squared Error assuming values in [0,1]. Lower
%           values means better quality.
% 
%     Copyright (C) 2006  Francesco Banterle
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%

if(isSameImage(imgReference, imgDistorted) == 0)
    error('The two images are different they can not be used or there are more than one channel.');
end

if(isa(imgReference, 'uint8'))
    imgReference = double(imgReference) / 255.0;
end

if(isa(imgDistorted, 'uint8'))
    imgDistorted = double(imgDistorted) / 255.0;
end

if(isa(imgReference, 'uint16'))
    imgReference = double(imgReference) / 65535.0;
end

if(isa(imgDistorted, 'uint16'))
    imgDistorted = double(imgDistorted) / 65535.0;
end

delta_sq = (imgReference - imgDistorted).^2;

val = mean(delta_sq(:));

end
