import { Controller, Post, Body, Get, UseGuards } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { LoginDto } from "./dto/login.dto";
import { JWTAuthGuard } from "./guards/jwt-auth.guard";
import { CurrentUser } from "./decorators/current-user.decorator";

@Controller('auth')
export class AuthController{
  constructor( private readonly authService : AuthService ) {}

  @Post('login')
  login(@Body() loginDto : LoginDto) {
    return this.authService.login(loginDto)
  }

  @UseGuards(JWTAuthGuard)
  @Get('profile')
  getProfile(@CurrentUser() user){
    return user
  }
}