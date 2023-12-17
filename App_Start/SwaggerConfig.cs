using System.Web;
using System.Web.Optimization;
using System.Web.Http;
using Swashbuckle.AspNetCore.SwaggerUI;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;
using Swashbuckle;
using Swashbuckle.Application;
namespace WebApi.App_Start
{
    public class SwaggerConfig
    {
        public static void Register()
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;
            
            GlobalConfiguration.Configuration
              .EnableSwagger(c => c.SingleApiVersion("v1", "ErrorHandlingWebAPI"))
              .EnableSwaggerUi();
        }
    }
}
