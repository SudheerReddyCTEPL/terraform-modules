locals {
    public_route_table_name = format("%s-%s",lookup(var.tags,"Name"), "public")
    private_route_table_name = format("%s-%s",lookup(var.tags, "Name"), "private")
    # database_route_table_name = format("%s-%s",lookup(var.tags, "Name"), "database")

    vpc_id = module.vpc_id
    # rds_security_group_id = module.rds_sg.security_group_id
    # db_subnet_group_name = module.db_subnet_group_name

    # ecs_cluster_id = module.ecs_cluster.ecs_cluster_id
    # app_alb_security_group_id = module.app_alb_security_group_id
   
    }

