package doan.quizzOnline.globalException;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@ControllerAdvice
public class BaseException extends ResponseEntityExceptionHandler {
	final Logger logger = Logger.getLogger(this.getClass());

	@ExceptionHandler(MultipartException.class)
	public String handleError2(MultipartException e, RedirectAttributes redirectAttributes) {
		logger.error("handle File too large exception");	
        redirectAttributes.addFlashAttribute("message", e.getCause().getMessage());
        logger.info("done Handle Exception");
        return "uploadStatus";
    }
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleError2(MaxUploadSizeExceededException e, RedirectAttributes redirectAttributes) {
		logger.error("handle File >10Mb");
        redirectAttributes.addFlashAttribute("message", e.getCause().getMessage());
        logger.info("Success handle file > 10MB");
        return "uploadStatus";
    }
}
