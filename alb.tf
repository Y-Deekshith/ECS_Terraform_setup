resource "aws_alb" "myalb" {
  name                       = "applb-load-balancer"
  subnets                    = [for subnet in aws_subnet.public_subnets : subnet.id]
  security_groups            = [aws_security_group.sg.id]
  enable_deletion_protection = false
  tags = {
    Name = "${var.name}-alb"
  }
  depends_on = [
    aws_alb_target_group.alb_tg
  ]
}

resource "aws_alb_target_group" "alb_tg" {
  name        = "applb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.deevpc.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "alb_listner" {
  load_balancer_arn = aws_alb.myalb.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = "forward"
  }
}

